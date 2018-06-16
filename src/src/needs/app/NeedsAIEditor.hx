package needs.app;

import haxe.io.Path;
import haxe.ui.Toolkit;
import lime.utils.Resource;
import msignal.Signal.Signal0;
import msignal.Signal.Signal1;
import needs.common.Config;
import needs.file.FileReader;
import needs.model.ProjectData;
import needs.serialization.Serializer;
import needs.ui.dialog.OpenProjectDialog;
import needs.ui.dialog.SaveProjectDialog;
import needs.ui.window.MainWindow;
import openfl.Lib;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.net.URLRequest;
import openfl.ui.Keyboard;

class NeedsAIEditor {
	public var beforeCreateNewProject(default, null) = new Signal0();
	public var afterCreateNewProject(default, null) = new Signal0();
	
	public var beforeLoadProject(default, null) = new Signal0();
	public var afterLoadProject(default, null) = new Signal1<ProjectData>();
	
	public var beforeSaveProject(default, null) = new Signal0();
	public var afterSaveProject(default, null) = new Signal1<ProjectData>();
	
	public var beforeExportToHaxe(default, null) = new Signal0();
	public var afterExportToHaxe(default, null) = new Signal0();
	
	public var beforeOpenTutorialUrl(default, null) = new Signal0();
	public var afterOpenTutorialUrl(default, null) = new Signal0();
	
	public var beforeOpenCodeRepoUrl(default, null) = new Signal0();
	public var afterOpenCodeRepoUrl(default, null) = new Signal0();
	
	public var beforeOpenWebDemoUrl(default, null) = new Signal0();
	public var afterOpenWebDemoUrl(default, null) = new Signal0();
	
	private var projectData:ProjectData = null;
	
	public function new(sprite:Sprite) {
		// Initialize HaxeUI
		Toolkit.init();
		
		// Load the user interface
		try {
			var window = new MainWindow();
			window.app = this;
			sprite.addChild(window);
		} catch (e:Dynamic) {
			
		}
		
		// Add handler for drag-dropping of project files
		sprite.stage.window.onDropFile.add(function(path:String) {
			fileDropped(path);
		});
		
		// Setup global keyboard shortcut handling
		sprite.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		
		// TODO recent files dropdown list
		// TODO main window tabs - project -> window with responses|inputs|considerations|actions|actionsets|reasoners|brains|archetypes|objectdefs(for smart world stuff?)
		// TODO scan needs-ai-lib code using macro + reflection to generate graph editors instead of hardcoding
		
		// Run a timer that autosaves the current project on a regular basis
		//Timer.delay(saveProject, 30000);
		
		createNewProject();
	}
	
	public function createNewProject():Void {
		beforeCreateNewProject.dispatch();
		
		this.projectData = new ProjectData();
		
		afterCreateNewProject.dispatch();
	}
	
	public function openLoadProjectDialog():Void {
		new OpenProjectDialog().open("json", Config.getLoadProjectDirectory().toString(), "Open Project", function(resource:Resource):Void {
			openProject(resource);
		});
	}
	
	public function openSaveProjectAsDialog():Void {
		// TODO only save-as if we don't know the existing project file location
		var data = Serializer.serializeProjectData(projectData);
		new SaveProjectDialog().save(data, "json", Config.getSaveProjectDirectory().toString() + "/project.json", "Save Project As");
	}
	
	public function openSaveProjectAsDialogOrSaveProjectToKnownPath():Void {
		
	}
	
	public function fileDropped(filepath:String):Void {
		var path = new Path(filepath);
		this.projectData = FileReader.loadProject(path); // TODO add error checking and messagebox/rollback
	}
	
	public function openProject(json:String):Void {
		var projectData:ProjectData = Serializer.unserializeProjectData(json);
		this.projectData = projectData; // TODO add error checking and messagebox/rollback
	}
	
	private function loadProject(projectData:ProjectData):Void {
		beforeLoadProject.dispatch();
		
		afterLoadProject.dispatch(projectData);
	}
	
	private function saveProject(projectData:ProjectData):Void {
		beforeSaveProject.dispatch();
		
		afterSaveProject.dispatch(projectData);
	}
	
	private function exportProjectToHaxe():Void {
		beforeExportToHaxe.dispatch();
		
		//new HaxeCodeGenerator(); // TODO
		
		afterExportToHaxe.dispatch();
	}
	
	public function openTutorialUrl():Void {
		beforeOpenTutorialUrl.dispatch();
		
		Lib.getURL(new URLRequest(Config.tutorialUrl));
		
		afterOpenTutorialUrl.dispatch();
	}
	
	public function openCodeRepoUrl():Void {
		beforeOpenCodeRepoUrl.dispatch();
		
		Lib.getURL(new URLRequest(Config.codeRepositoryUrl));
		
		afterOpenCodeRepoUrl.dispatch();
	}
	
	public function openWebDemoUrl():Void {
		beforeOpenWebDemoUrl.dispatch();
		
		Lib.getURL(new URLRequest(Config.webDemoUrl));
		
		afterOpenWebDemoUrl.dispatch();
	}
	
	private function onKeyDown(evt:KeyboardEvent):Void {
		if (evt.ctrlKey) {
			if (evt.keyCode == Keyboard.S) {
				openSaveProjectAsDialog();
			} else if (evt.keyCode == Keyboard.O || evt.keyCode == Keyboard.L) {
				openLoadProjectDialog();
			} else if (evt.keyCode == Keyboard.N) {
				createNewProject();
			} else if (evt.keyCode == Keyboard.E) {
				exportProjectToHaxe();
			}
		}
	}
}
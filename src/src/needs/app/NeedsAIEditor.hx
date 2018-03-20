package needs.app;

import haxe.Timer;
import haxe.io.Path;
import haxe.ui.Toolkit;
import lime.utils.Resource;
import needs.common.Config;
import needs.model.ProjectData;
import needs.serialization.Serializer;
import needs.ui.dialog.OpenProjectDialog;
import needs.ui.dialog.SaveProjectDialog;
import needs.ui.window.MainWindow;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import needs.code.HaxeCodeGenerator;
import needs.file.FileReader;

class NeedsAIEditor {
	private var projectData:ProjectData = new ProjectData();
	
	public function new(sprite:Sprite) {
		// Initialize HaxeUI
		Toolkit.init();
		
		// Load the user interface
		try {
			sprite.addChild(new MainWindow());
		} catch (e:Dynamic) {
			// TODO show messagebox warning unhandled about exception
		}
		
		// Add handler for drag-dropping of project files
		sprite.stage.window.onDropFile.add(function(path:String) {
			fileDropped(path);
		});
		
		// Setup global keyboard shortcut handling
		sprite.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		
		// TODO attempt to open last-opened project (export paths, widget positions/layout)
		// TODO recent files dropdown list
		// TODO main window tabs - project -> window with responses|inputs|considerations|actions|actionsets|reasoners|brains|archetypes|objectdefs(for smart world stuff?)
		// TODO one-button source code export
		// TODO scan needs-ai-lib code using macro + reflection to generate graph editors instead of hardcoding
		
		// Run a timer that autosaves the current project on a regular basis
		Timer.delay(saveCurrentProject, 30000);
	}
	
	public function loadProject(projectData:ProjectData):Void {
		
	}
	
	private function onKeyDown(evt:KeyboardEvent):Void {
		if (evt.ctrlKey) {
			if (evt.keyCode == Keyboard.S) {
				openSaveProjectDialog();
			} else if (evt.keyCode == Keyboard.O || evt.keyCode == Keyboard.L) {
				openLoadProjectDialog();
			} else if (evt.keyCode == Keyboard.N) {
				openNewProject();
			} else if (evt.keyCode == Keyboard.E) {
				exportProjectToHaxe();
			}
		}
	}
	
	private function openLoadProjectDialog():Void {
		new OpenProjectDialog().open("json", Config.getLoadProjectDirectory().toString(), "Open Project", function(resource:Resource):Void {
			openProject(resource);
		});
	}
	
	private function openSaveProjectDialog():Void {
		// TODO only save-as if we don't know the existing project file location
		var data = Serializer.serializeProjectData(projectData);
		new SaveProjectDialog().save(data, "json", Config.getSaveProjectDirectory().toString() + "/project.json", "Save Project As");
	}
	
	private function openNewProject():Void {
		this.projectData = new ProjectData();
	}
	
	private function exportProjectToHaxe():Void {
		//new HaxeCodeGenerator();
	}
	
	private function fileDropped(filepath:String):Void {
		var path = new Path(filepath);
		this.projectData = FileReader.loadProject(path); // TODO add error checking and messagebox/rollback
	}
	
	private function saveCurrentProject():Void {
	}
	
	private function openProject(json:String):Void {
		var projectData:ProjectData = Serializer.unserializeProjectData(json);
		this.projectData = projectData; // TODO add error checking and messagebox/rollback
	}
}
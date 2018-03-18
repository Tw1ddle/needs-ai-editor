package needs.app;

import haxe.io.Path;
import haxe.ui.Toolkit;
import needs.model.Project;
import needs.ui.dialog.OpenProjectDialog;
import needs.ui.dialog.SaveProjectDialog;
import needs.ui.window.MainWindow;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import needs.common.Config;
import haxe.Timer;

class NeedsAIEditor {
	private var project:Project = new Project();
	
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
	
	public function loadProject(project:Project):Void {
		
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
	
	private function undo():Bool {
		return false;
	}
	
	private function redo():Bool {
		return false;
	}
	
	private function openLoadProjectDialog():Void {
		new OpenProjectDialog().open("json", Config.getLoadProjectDirectory().toString(), "Open Project");
	}
	
	private function openSaveProjectDialog():Void {
		// TODO actually serialize the project file, and also only save-as if we don't know the existing project file location
		new SaveProjectDialog().save("", "json", Config.getSaveProjectDirectory().toString() + "/project.json", "Save Project As");
	}
	
	private function openNewProject():Void {
		
	}
	
	private function exportProjectToHaxe():Void {
		
	}
	
	private function fileDropped(file:String):Void {
		var path = new Path(file);
		
		// TODO try to load project
	}
	
	private function saveCurrentProject():Void {
		
	}
}
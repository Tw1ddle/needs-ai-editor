package needs.app;

import haxe.ui.Toolkit;
import needs.app.NeedsAIEditor;
import needs.model.Project;
import needs.ui.window.MainWindow;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;

class NeedsAIEditor {
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
			trace ("user dropped file with path: " + path);
		});
		
		// Setup global keyboard shortcut handling
		sprite.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		
		// TODO attempt to open last-opened project (export paths, widget positions/layout)
		// TODO recent files list
		// TODO main window tabs - project -> window with responses|inputs|considerations|actions|actionsets|reasoners|brains|archetypes|objectdefs(for smart world stuff?)
		// TODO one-button source code export
		// TODO autosave project state
		// TODO undo/redo options (either use reversible command driven architecture or just save/restore entire application state (this shouldn't be too heavy as data models should be smallish)
		// TODO scan needs-ai-lib code using macro + reflection to generate graph editors instead of hardcoding
	}
	
	public function loadProject(project:Project):Void {
		
	}
	
	private function onKeyDown(evt:KeyboardEvent):Void {
		if (evt.ctrlKey) {
			if (evt.keyCode == Keyboard.Z) {
				undo();
			} else if (evt.keyCode == Keyboard.Y) {
				redo();
			} else if (evt.keyCode == Keyboard.S) {
				saveProject();
			} else if (evt.keyCode == Keyboard.O) {
				openSelectProjectDialog();
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
	
	private function openSelectProjectDialog():Void {
		
	}
	
	private function saveProject():Void {
		
	}
	
	private function openNewProject():Void {
		
	}
	
	private function exportProjectToHaxe():Void {
		
	}
}
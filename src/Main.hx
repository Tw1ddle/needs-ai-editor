package;

import needs.ai.editor.widgets.LauncherWindow;
import flash.display.Sprite;
import haxe.ui.Toolkit;

class Main extends Sprite {
    public function new () {
		super ();
		
		Toolkit.init();
		
		// TODO attempt to open last-opened project
		// TODO recent files list
		// TODO saved settings (export paths, widget positions/layout)
		// TODO main window tabs - project -> window with responses|inputs|considerations|actions|actionsets|reasoners|brains|archetypes|objectdefs(for smart world stuff?)
		// TODO drag-drop project files
		// TODO one-button source code export
		// TODO autosave project state
		// TODO scan needs-ai-lib and generate graph editors etc if possible
		
		// TODO cli options to generate code as part of project build process i.e. add it as a build step
		
		try {
			var launcherWindow:LauncherWindow = new LauncherWindow();
			this.addChild(launcherWindow);
		} catch (e:Dynamic) {
			// TODO show messagebox warning unhandled about exception?
		}
		
		// TODO ensure settings etc are saved on exit
	}
}
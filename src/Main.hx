package;

import flash.display.Sprite;
import lime.app.Application;
import needs.app.NeedsAIEditor;
import needs.cli.OptionHandler;
import needs.common.Config;

class Main extends Sprite {
	private var editor:NeedsAIEditor = null;
	
    public function new () {
		super();
		
		// Try to load global preferences
		try {
			if (!Config.globalPreferences.configFileExists()) {
				Config.globalPreferences.save(); // Save default preferences file
			}
			Config.globalPreferences.load();
		} catch (e:String) {
			trace("Failed to load preferences, error: " + e);
		}
		
		// Bump app launch count
		Config.globalPreferences.applicationLaunchCount += 1;
		
		// Try to process command line options
		// TODO options to load project, generate code and exit early, so this can be used as part of a project build process i.e. add code generation as a build step
		var cliOptionHandler = new OptionHandler();
		cliOptionHandler.processOptions();
		
		// Create the editor GUI
		editor = new NeedsAIEditor(this);
		
		// Ensure global preferences etc are saved on exit
		Application.current.onExit.add(function(i:Int) {
			Config.globalPreferences.save();
		});
	}
}
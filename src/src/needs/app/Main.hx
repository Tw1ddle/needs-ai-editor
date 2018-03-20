package needs.app;

import flash.display.Sprite;
import lime.app.Application;
import needs.app.NeedsAIEditor;
import needs.cli.OptionHandler;
import needs.common.Config;
import needs.file.FileWriter;

class Main extends Sprite {
	private var editor:NeedsAIEditor = null;
	
    public function new () {
		super();
		
		// Try to load persistent global preferences from file
		Config.loadGlobalPreferencesOnLaunch();
		
		// Bump app launch count
		Config.globalPreferences.applicationLaunchCount += 1;
		
		// Process command line options
		var cliOptionHandler = new OptionHandler();
		cliOptionHandler.processOptions();
		
		// Create the editor GUI
		editor = new NeedsAIEditor(this);
		
		// Ensure global preferences etc are saved on exit
		Application.current.onExit.add(function(i:Int) {
			FileWriter.saveGlobalPreferences(Config.getDefaultGlobalPreferencesFilepath(), Config.globalPreferences);
		});
	}
}
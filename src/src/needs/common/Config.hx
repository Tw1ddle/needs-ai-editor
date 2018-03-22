package needs.common;

import haxe.io.Path;
import lime.system.System;
import needs.settings.GlobalPreferences;
import needs.file.FileReader;
import needs.file.FileWriter;

class Config {
	public static var tutorialUrl(default, null):String = "TODO";
	public static var codeRepositoryUrl(default, null):String = "https://github.com/Tw1ddle/needs-ai-editor";
	public static var webDemoUrl(default, null):String = "https://tw1ddle.github.io/needs-ai/index.html";
	
	public static var globalPreferences:GlobalPreferences = new GlobalPreferences();
	
	public static function loadGlobalPreferencesOnLaunch():Void {
		// Save default global preferences to file, if such a file doesn't already exist
		try {
			if (!FileReader.globalPreferencesFileExists()) {
				FileWriter.saveGlobalPreferences(Config.getDefaultGlobalPreferencesFilepath(), Config.globalPreferences);
			}
		} catch (e:Dynamic) {
			trace("Failed to create a default global preferences file, error: " + e);
		}
		
		// Try to load global preferences from file
		try {
			var prefs = FileReader.loadGlobalPreferences(Config.getDefaultGlobalPreferencesFilepath());
			if (prefs == null) {
				throw "Failed to read global preferences file";
			}
			Config.globalPreferences = prefs;
		} catch (e:Dynamic) {
			trace("Failed to load global preferences, error: " + e);
		}
	}
	
	public static function getGlobalPreferencesDirectory():Path {
		var dir:String = System.desktopDirectory;
		if (dir == null) {
			throw "No desktop directory";
		}
		return new Path(Path.normalize(dir));
	}
	
	public static function getDefaultHaxeCodeExportDirectory():Path {
		var dir:String = System.desktopDirectory;
		if (dir == null) {
			throw "No desktop directory";
		}
		return new Path(Path.normalize(dir) + "/needs_ai_editor_haxe_code");
	}
	
	public static function getLoadProjectDirectory():Path {
		if (globalPreferences.recentProjectFilepaths.length != 0 && globalPreferences.recentProjectFilepaths[0].length != 0) {
			return new Path(Path.normalize(globalPreferences.recentProjectFilepaths[0]));
		}
		
		var dir:String = System.desktopDirectory;
		if (dir == null) {
			throw "No desktop directory";
		}
		return new Path(Path.normalize(dir));
	}
	
	public static function getSaveProjectDirectory():Path {
		return getLoadProjectDirectory();
	}
	
	public static function getDefaultGlobalPreferencesFilepath():Path {
		return new Path(Path.normalize(getGlobalPreferencesDirectory().toString() + "/needs_ai_editor_global_prefs.data"));
	}
}
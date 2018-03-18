package needs.common;

import haxe.io.Path;
import lime.system.System;
import needs.settings.GlobalPreferences;

class Config {
	public static var globalPreferences(default, null):GlobalPreferences = new GlobalPreferences();
	
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
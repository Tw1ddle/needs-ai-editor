package needs.common;

import lime.system.System;
import haxe.io.Path;
import needs.settings.GlobalPreferences;

class Config {
	public static var globalPreferences(default, null):GlobalPreferences = new GlobalPreferences();
	
	public static function getGlobalPreferencesDirectory():Path {
		var dir:String = System.desktopDirectory;
		if (dir == null) {
			throw "No desktop directory";
		}
		return new Path(Path.normalize(Path.addTrailingSlash(dir)));
	}
	
	public static function getDefaultGlobalPreferencesFilepath():Path {
		return new Path(getGlobalPreferencesDirectory().toString() + "needs_ai_editor_global_prefs.json");
	}
}
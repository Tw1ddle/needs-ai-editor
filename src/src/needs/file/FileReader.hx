package needs.file;

import haxe.io.Path;
import json2object.Error;
import json2object.JsonParser;
import needs.common.Config;
import needs.model.ProjectData;
import needs.settings.GlobalPreferences;

#if sys
import sys.io.File;
import sys.FileSystem;
#end

class FileReader {
	public static function globalPreferencesFileExists():Bool {
		#if sys
		return FileSystem.exists(Config.getDefaultGlobalPreferencesFilepath().toString());
		#end
		
		return false;
	}
	
	public static function loadGlobalPreferences(filepath:Path):GlobalPreferences {
		#if sys
		var data:String = File.getContent(filepath.toString());
		var errors:Array<json2object.Error> = [];
		var prefs:GlobalPreferences = new JsonParser<GlobalPreferences>(errors).fromJson(data, "");
		
		if (errors.length != 0) {
			throw "Encountered JSON read errors when loading global preferences " + errors.toString();
		}
		
		return prefs;
		
		#else
		return new GlobalPreferences();
		#end
	}
	
	public static function loadProject(filepath:Path):ProjectData {
		#if sys
		var data:String = File.getContent(filepath.toString());
		var errors:Array<json2object.Error> = [];
		var prefs:ProjectData = new JsonParser<ProjectData>(errors).fromJson(data, "");
		
		if (errors.length != 0) {
			throw "Encountered JSON read errors when loading project " + errors.toString();
		}
		
		return prefs;
		
		#else
		return new ProjectData();
		#end
	}
}
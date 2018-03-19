package needs.file;

import haxe.io.Path;
import json2object.Error;
import json2object.JsonParser;
import needs.common.Config;
import needs.model.Project;
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
		return prefs;
		
		#else
		return new GlobalPreferences();
		#end
	}
	
	public static function loadProject(filepath:Path):Project {
		#if sys
		var data:String = File.getContent(filepath.toString());
		var errors:Array<json2object.Error> = [];
		var prefs:Project = new JsonParser<Project>(errors).fromJson(data, "");
		return prefs;
		
		#else
		return new Project();
		#end
	}
}
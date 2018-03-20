package needs.file;

import haxe.io.Path;
import json2object.Error;
import json2object.JsonParser;
import needs.common.Config;
import needs.model.ProjectData;
import needs.settings.GlobalPreferences;
import needs.serialization.Serializer;

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
		var prefs = Serializer.unserializeGlobalPreferences(data);
		return prefs;
		
		#else
		return new GlobalPreferences();
		#end
	}
	
	public static function loadProject(filepath:Path):ProjectData {
		#if sys
		var data:String = File.getContent(filepath.toString());
		var prefs = Serializer.unserializeProjectData(data);
		return prefs;
		
		#else
		return new ProjectData();
		#end
	}
}
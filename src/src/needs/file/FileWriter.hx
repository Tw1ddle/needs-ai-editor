package needs.file;

import haxe.io.Path;
import json2object.JsonWriter;
import needs.model.ProjectData;
import needs.settings.GlobalPreferences;
import needs.serialization.Serializer;

#if sys
import sys.io.File;
#end

class FileWriter {
	public static function saveGlobalPreferences(filepath:Path, prefs:GlobalPreferences):Void {
		#if sys
		var json = Serializer.serializeGlobalPreferences(prefs);
		File.saveContent(filepath.toString(), json);
		#end
	}
	
	public static function saveProjectFile(filepath:Path, project:ProjectData):Void {
		#if sys
		var json = Serializer.serializeProjectData(project);
		File.saveContent(filepath.toString(), json);
		#end
	}
}
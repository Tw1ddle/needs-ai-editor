package needs.file;

import haxe.io.Path;
import json2object.JsonWriter;
import needs.model.Project;
import needs.settings.GlobalPreferences;

#if sys
import sys.io.File;
#end

class FileWriter {
	public static function saveGlobalPreferences(filepath:Path, prefs:GlobalPreferences):Void {
		#if sys
		var writer = new json2object.JsonWriter<GlobalPreferences>();
		var json:String = writer.write(prefs);
		File.saveContent(filepath.toString(), json);
		#end
	}
	
	public static function saveProjectFile(filepath:Path, project:Project):Void {
		#if sys
		var writer = new json2object.JsonWriter<Project>();
		var json:String = writer.write(project);
		File.saveContent(filepath.toString(), json);
		#end
	}
}
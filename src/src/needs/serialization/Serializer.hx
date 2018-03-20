package needs.serialization;

import json2object.JsonParser;
import json2object.JsonWriter;
import needs.model.ProjectData;
import needs.settings.GlobalPreferences;

class Serializer
{
	public static function serializeGlobalPreferences(prefs:GlobalPreferences):String {
		var writer = new JsonWriter<GlobalPreferences>();
		return writer.write(prefs);
	}
	
	public static function unserializeGlobalPreferences(json:String):GlobalPreferences {
		var errors = new Array<json2object.Error>();
		var reader = new JsonParser<GlobalPreferences>(errors);
		reader.fromJson(json, "");
		return reader.value;
	}
	
	public static function serializeProjectData(project:ProjectData):String {
		var writer = new JsonWriter<ProjectData>();
		return writer.write(project);
	}
	
	public static function unserializeProjectData(json:String):ProjectData {
		var errors = new Array<json2object.Error>();
		var reader = new JsonParser<ProjectData>(errors);
		reader.fromJson(json, "");
		return reader.value;
	}
}
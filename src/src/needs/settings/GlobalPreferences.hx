package needs.settings;

import haxe.Unserializer;
import needs.serialization.HxSerializator;
import needs.common.Config;
import haxe.Serializer;
import sys.io.File;

#if sys
import sys.FileSystem;
#end

@:build(needs.serialization.HxSerializator.build())
@:autoBuild(needs.serialization.HxSerializator.build())
class GlobalPreferences {
	@:noSerialize public function new() {}
	
	@:noSerialize public function load():Bool {
		try {
			#if sys
			var data:String = File.getContent(Config.getDefaultGlobalPreferencesFilepath().toString());
			
			var unserializer = new Unserializer(data);
			this.hxUnserialize(unserializer);
			
			return true;
			#else
			return false;
			#end
		} catch (e:Dynamic) {
			return false;
		}
		return false;
	}
	
	@:noSerialize public function save():Bool {
		try {
			var serializer = new Serializer();
			this.hxSerialize(serializer);
			var data = serializer.toString();
			
			#if sys
			File.saveContent(Config.getDefaultGlobalPreferencesFilepath().toString(), data);
			return true;
			#else
			return false;
			#end
		} catch (e:Dynamic) {
			return false;
		}
		return false;
	}
	
	@:noSerialize public function configFileExists():Bool {
		#if sys
		return FileSystem.exists(Config.getDefaultGlobalPreferencesFilepath().toString());
		#end
		
		return false;
	}
	
	public var applicationLaunchCount:Int = 0;
	
	// TODO
	//public var lastSelectedPanelId:String = WelcomePanel.id;
	//public var lastWindowWidth:Int = 0;
	//public var lastWindowHeight:Int = 0;
	//public var lastLoadedProjectFile:String = "";
	public var recentProjectFilepaths:Array<String> = [];
}
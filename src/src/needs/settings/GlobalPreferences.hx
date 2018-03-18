package needs.settings;

import needs.serialization.Serializer;
import needs.common.Config;

#if sys
import sys.FileSystem;
#end

@:build(needs.serialization.Serializer.build())
@:autoBuild(needs.serialization.Serializer.build())
class GlobalPreferences {
	@:noSerialize public function new() {}
	
	@:noSerialize public function load():Bool {
		#if sys
		#end
		
		return false; // TODO
	}
	
	@:noSerialize public function save():Bool {
		#if sys
		#end
		
		return false; // TODO
	}
	
	@:noSerialize public function configFileExists():Bool {
		#if sys
		return FileSystem.exists(Config.getDefaultGlobalPreferencesFilepath().toString());
		#end
		
		return false;
	}
	
	public var applicationLaunchCount:Int = 0;
}
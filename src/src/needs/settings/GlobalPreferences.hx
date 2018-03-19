package needs.settings;

import haxe.io.Path;
import needs.common.Config;

#if sys
import sys.FileSystem;
#end

class GlobalPreferences {
	@:jignored public function new() {}
	
	@:optional public var applicationLaunchCount:Int = 0;
	
	// TODO
	//@:optional public var lastSelectedPanelId:String = WelcomePanel.id;
	//@:optional public var lastWindowWidth:Int = 0;
	//@:optional public var lastWindowHeight:Int = 0;
	//@:optional public var lastLoadedProjectFile:String = "";
	@:optional public var recentProjectFilepaths:Array<String> = [];
}
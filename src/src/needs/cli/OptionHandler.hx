package needs.cli;

// TODO process options to load project, generate code and exit early, so this can be used as part of a project build process i.e. add code generation as a build step

class OptionHandler {
	private var options:Array<Option> = [];
	
	public function new() {
		#if (neko || cpp || php)
		determineOptions(Sys.args());
		#end
	}
	
	public function processOptions():Void {
		
	}
	
	private function determineOptions(args:Array<String>):Void {
		for (arg in args) {
			// TODO push back option for recognized arguments
		}
	}
}
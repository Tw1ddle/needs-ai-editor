package needs.cli;

class OptionHandler {
	private var options:Array<Option> = [];
	
	public function new() {
		#if neko cpp php
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
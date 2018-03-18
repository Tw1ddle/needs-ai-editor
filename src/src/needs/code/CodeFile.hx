package needs.code;

import haxe.io.Path;

class CodeFile {
	public var filepath(default, null):Path;
	public var code(default, null):String;
	
	public function new(filepath:Path, code:String) {
		this.filepath = filepath;
		this.code = code;
	}
}
package needs.ui.dialog;

import lime.ui.FileDialog;

class OpenProjectDialog {
	public function new() {
	}
	
	public function open(filter:String, defaultPath:String, title:String):Bool {
		return new lime.ui.FileDialog().open(filter, defaultPath, title);
	}
}
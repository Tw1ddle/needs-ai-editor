package needs.ui.dialog;

import lime.utils.Resource;
import lime.ui.FileDialog;

class SaveProjectDialog {
	public function new() {
	}
	
	public function save(data:Resource, filter:String, defaultPath:String, title:String):Bool {
		return new lime.ui.FileDialog().save(data, filter, defaultPath, title);
	}
}
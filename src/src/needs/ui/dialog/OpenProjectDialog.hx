package needs.ui.dialog;

import lime.app.Event;
import lime.ui.FileDialog;
import lime.utils.Resource;

class OpenProjectDialog {
	public function new() {
	}
	
	public function open(filter:String, defaultPath:String, title:String, onOpen:Resource->Void) {
		var dialog:FileDialog = new lime.ui.FileDialog();
		dialog.onOpen.add(onOpen);
		dialog.open(filter, defaultPath, title);
	}
}
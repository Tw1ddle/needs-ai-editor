package needs.ai.editor.widgets;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class LauncherWindow extends Component {
	public function new() {
		super();
		
		var window = ComponentMacros.buildComponent("assets/ui/launcherwindow.xml");
		addComponent(window);
	}
}
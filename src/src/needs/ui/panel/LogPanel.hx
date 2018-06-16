package needs.ui.panel;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class LogPanel extends Component {
	public function new() {
		super();
		text = "Log";
		
		var window = ComponentMacros.buildComponent("assets/ui/panel/logpanel.xml");
		addComponent(window);
	}
}
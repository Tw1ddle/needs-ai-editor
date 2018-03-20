package needs.ui.panel;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class WelcomePanel extends Component {
	public function new() {
		super();
		text = "Welcome";
		
		var window = ComponentMacros.buildComponent("assets/ui/panel/welcomepanel.xml");
		addComponent(window);
	}
}
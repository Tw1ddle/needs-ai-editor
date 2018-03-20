package needs.ui.panel;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class ActionSetPanel extends Component {
	public function new() {
		super();
		text = "Action Sets";
		
		var window = ComponentMacros.buildComponent("assets/ui/panel/actionsetpanel.xml");
		addComponent(window);
	}
}
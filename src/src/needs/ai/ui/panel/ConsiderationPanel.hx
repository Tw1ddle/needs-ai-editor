package needs.ai.ui.panel;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class ConsiderationPanel extends Component {
	public function new() {
		super();
		
		var window = ComponentMacros.buildComponent("assets/ui/panel/brainpanel.xml");
		addComponent(window);
	}
}
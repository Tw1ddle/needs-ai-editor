package needs.ui.panel;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class ActionPanel extends Component {
	public function new() {
		super();
		text = "Actions";
		
		var window = ComponentMacros.buildComponent("assets/ui/panel/actionpanel.xml");
		addComponent(window);
	}
}
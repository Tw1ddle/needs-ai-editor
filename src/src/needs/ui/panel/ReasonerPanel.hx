package needs.ui.panel;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class ReasonerPanel extends Component {
	public function new() {
		super();
		text = "Reasoners";
		
		var window = ComponentMacros.buildComponent("assets/ui/panel/reasonerpanel.xml");
		addComponent(window);
	}
}
package needs.ui.panel;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class BrainPanel extends Component {
	public function new() {
		super();
		text = "Brains";
		
		var window = ComponentMacros.buildComponent("assets/ui/panel/brainpanel.xml");
		addComponent(window);
	}
}
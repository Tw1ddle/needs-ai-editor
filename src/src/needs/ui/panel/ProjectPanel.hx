package needs.ui.panel;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class ProjectPanel extends Component {
	public function new() {
		super();
		text = "Project";
		
		var window = ComponentMacros.buildComponent("assets/ui/panel/projectpanel.xml");
		addComponent(window);
	}
}
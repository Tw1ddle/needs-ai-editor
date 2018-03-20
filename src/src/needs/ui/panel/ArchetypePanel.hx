package needs.ui.panel;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class ArchetypePanel extends Component {
	public function new() {
		super();
		text = "Archetypes";
		
		var window = ComponentMacros.buildComponent("assets/ui/panel/archetypepanel.xml");
		addComponent(window);
	}
}
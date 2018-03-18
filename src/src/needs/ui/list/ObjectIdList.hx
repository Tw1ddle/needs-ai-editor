package needs.ui.list;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class ObjectIdPanel extends Component {
	public function new() {
		super();
		
		var list = ComponentMacros.buildComponent("assets/ui/list/optionidlist.xml");
		addComponent(list);
	}
}
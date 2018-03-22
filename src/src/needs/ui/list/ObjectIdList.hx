package needs.ui.list;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class ObjectIdPanel<T> extends Component {
	public function new() {
		super();
		
		var list = ComponentMacros.buildComponent("assets/ui/list/optionidlist.xml");
		addComponent(list);
	}
	
	public function addItem(item:T):Void {
		
	}
	
	public function deleteItem(item:T):Void {
		
	}
}
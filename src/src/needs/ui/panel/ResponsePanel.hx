package needs.ui.panel;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class ResponsePanel extends Component {
	private var responseClasses:Array<Class> = CompileTime.getAllClasses("needs.responses");
	
	public function new() {
		super();
		
		var window = ComponentMacros.buildComponent("assets/ui/panel/responsepanel.xml");
		addComponent(window);
	}
}
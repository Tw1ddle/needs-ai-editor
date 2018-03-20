package needs.ui.panel;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class ExportPanel extends Component {
	public function new() {
		super();
		text = "Export Haxe Code";
		
		var window = ComponentMacros.buildComponent("assets/ui/panel/exportpanel.xml");
		addComponent(window);
	}
}
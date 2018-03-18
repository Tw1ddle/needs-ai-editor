package needs.ui.window;

import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class MainWindow extends Component {
	public function new() {
		super();
		
		var window = ComponentMacros.buildComponent("assets/ui/window/mainwindow.xml");
		addComponent(window);
		
		addSidebarActionButton("New Project", function() {
			
		});
		addSidebarActionButton("Load Project", function() {
			
		});
		addSidebarActionButton("Save Project", function() {
			
		});
		addSidebarActionButton("Save Project As", function() {
			
		});
		addSidebarActionButton("Export To Haxe", function() {
			
		});
		addSidebarActionButton("Recent Projects", function() {
			
		});
		
		addPanelSelectButton("Welcome", function() {
			
		});
		addPanelSelectButton("Responses", function() {
			
		});
		addPanelSelectButton("Inputs", function() {
			
		});
		addPanelSelectButton("Considerations", function() {
			
		});
		addPanelSelectButton("Actions", function() {
			
		});
		addPanelSelectButton("Action Sets", function() {
			
		});
		addPanelSelectButton("Reasoners", function() {
			
		});
		addPanelSelectButton("Brains", function() {
			
		});
		addPanelSelectButton("Archetypes", function() {
			
		});
		addPanelSelectButton("Environments", function() {
			
		});
	}
	
	private function addSidebarActionButton(text:String, onPress:Void->Void):Void {
		
	}
	
	private function addPanelSelectButton(text:String, onPress:Void->Void):Void {
		
	}
}
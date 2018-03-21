package needs.ui.window;

import haxe.ui.components.Button;
import haxe.ui.components.Label;
import haxe.ui.components.Spacer;
import haxe.ui.containers.ScrollView;
import haxe.ui.containers.TabView;
import haxe.ui.core.Component;
import haxe.ui.core.MouseEvent;
import haxe.ui.macros.ComponentMacros;
import needs.app.NeedsAIEditor;
import needs.ui.panel.ActionPanel;
import needs.ui.panel.ActionSetPanel;
import needs.ui.panel.ArchetypePanel;
import needs.ui.panel.BrainPanel;
import needs.ui.panel.ConsiderationPanel;
import needs.ui.panel.EnvironmentPanel;
import needs.ui.panel.ExportPanel;
import needs.ui.panel.InputPanel;
import needs.ui.panel.ReasonerPanel;
import needs.ui.panel.ResponsePanel;
import needs.ui.panel.WelcomePanel;

class MainWindow extends Component {
	public var app:NeedsAIEditor;
	
	public function new() {
		super();
		
		var window = ComponentMacros.buildComponent("assets/ui/window/mainwindow.xml");
		addComponent(window);
		
		addAppTitle("Needs AI Editor");
		
		addSidebarButton("New Project", function(e:MouseEvent) {
			
		});
		addSidebarButton("Load Project", function(e:MouseEvent) {
			
		});
		addSidebarButton("Save Project", function(e:MouseEvent) {
			
		});
		addSidebarButton("Save Project As", function(e:MouseEvent) {
			
		});
		addSidebarButton("Recent Projects", function(e:MouseEvent) {
			
		});
		
		var panels = [
			new WelcomePanel(),
			new InputPanel(),
			new ResponsePanel(),
			new ConsiderationPanel(),
			new ActionPanel(),
			new ActionSetPanel(),
			new ReasonerPanel(),
			new BrainPanel(),
			new ArchetypePanel(),
			new EnvironmentPanel(),
			new ExportPanel()
		];
		for (panel in panels) {
			addPanel(panel);
		}
	}
	
	private function addAppTitle(text:String):Void {
		var scrollView:ScrollView = cast findComponent("sidebarscrollview");
		
		var label:Label = new Label();
		label.text = text;
		label.id = "appTitle";
		
		var spacer:Spacer = new Spacer();
		spacer.id = "appTitleSpacer";
		
		scrollView.addComponent(label);
		scrollView.addComponent(spacer);
		scrollView.invalidate();
	}
	
	private function addSidebarButton(text:String, onPress:MouseEvent->Void):Void {
		var scrollView:ScrollView = cast findComponent("sidebarscrollview");
		
		var button:Button = new Button();
		button.text = text;
		button.onClick = onPress;
		button.id = "styledButton";
		
		scrollView.addComponent(button);
		scrollView.invalidate();
	}
	
	private function addPanel(panel:Component):Void {
		var tabView:TabView = cast findComponent("paneltabview");
		tabView.addComponent(panel);
		tabView.invalidate();
	}
}
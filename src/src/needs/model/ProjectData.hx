package needs.model;

import game.ai.ids.InputId;
import game.ai.ids.ConsiderationId;
import game.ai.ids.ActionId;
import game.ai.ids.ActionSetId;
import game.ai.ids.ReasonerId;
import game.ai.ids.BrainId;
import game.ai.ids.ArcheTypeId;
import game.ai.ids.WorldObjectId;

class ProjectData {
	@:jignored public var idGenerator(default, null):IdGenerator;
	
	@:jignored public function new() {
		idGenerator = new IdGenerator(this);
	}
	
	// TODO serialize/deserialize
	// TODO signal on change for autosave
	
	// TODO signals for when everything happens i.e. handle deletion of ids that are used elsewhere etc
	
	// TODO decide on concrete types for needs ai ids/tags - object with an abstract int id and stringmap/variantmap(s) of properties perhaps?
	// TODO just build the editor with the type ids/tags as part of the project - then we can parse these to file more easily, and figure out how to manipulate fields in the editor more easily
	
	// TODO input ids/info - this needs to export straight to functions to be implemented in haxe, maybe with some smart autoconnection if pointed to existing haxe code that implements the functions?
	//public var responseData:Array<ResponseId> = []; // TODO response ids/info based on the existing response curves implemented in the library (can be adjusted by editor)
	public var inputData:Array<InputId> = [];
	public var considerationData:Array<ConsiderationId> = [];
	public var actionData:Array<ActionId> = [];
	public var actionSetData:Array<ActionSetId> = [];
	public var reasonerData:Array<ReasonerId> = [];
	public var brainData:Array<BrainId> = [];
	public var archeTypeData:Array<ArchetypeId> = [];
	public var objectDefs:Array<WorldObjectId> = []; // TODO arrays of action ids that are exposed through the items somehow(?). implies imbueing specific npcs/archetypes with object awareness. approach could be to leave actions empty and do the adding
	// of actions programatically when maps/environments are loaded (going the whole way integrating the level/map editor might be too much though)
}
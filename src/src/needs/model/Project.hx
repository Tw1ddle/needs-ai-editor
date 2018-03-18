package needs.model;

import needs.serialization.HxSerializator;

@:build(needs.serialization.HxSerializator.build())
@:autoBuild(needs.serialization.HxSerializator.build())
class Project {
	public var idGenerator(default, null):IdGenerator;
	
	public function new() {
		idGenerator = new IdGenerator(this);
	}
	
	public function serialize():Void {
		// TODO
	}
	
	public function deserialize():Void {
		// TODO
	}
	
	// TODO serialize/deserialize
	// TODO signal on change for autosave
	
	// TODO signals for when everything happens i.e. handle deletion of ids that are used elsewhere etc
	
	// TODO decide on concrete types for needs ai ids/tags - object with an abstract int id and stringmap/variantmap(s) of properties perhaps?
	
	public var inputData:Dynamic; // TODO input id/info - this needs to export straight to functions to be implemented in haxe, maybe with some smart autoconnection if pointed to existing haxe code that implements the functions?
	
	public var responseData:Dynamic; // TODO response ids/info based on the existing response curves implemented in the library (can be adjusted by editor)
	
	public var considerationData:Dynamic; // TODO arrays of input/response ids
	
	public var actionData:Dynamic; // TODO arrays of consideration ids
	
	public var actionSetData:Dynamic; // TODO arrays of action ids
	
	public var reasonerData:Dynamic; // TODO arrays of action set ids
	
	public var brainData:Dynamic; // TODO arrays of reasoner ids
	
	public var archeTypeData:Dynamic; // TODO arrays of archetype ids
	
	public var objectDefs:Dynamic; // TODO arrays of action ids that are exposed through the items somehow(?). implies imbueing specific npcs/archetypes with object awareness. approach could be to leave actions empty and do the adding
	// of actions programatically when maps/environments are loaded (going the whole way integrating the level/map editor might be too much though)
}
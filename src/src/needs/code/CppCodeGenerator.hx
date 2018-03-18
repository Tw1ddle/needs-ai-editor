package src.needs.code;

import needs.model.Project;
import needs.code.CodeFile;

// TODO probably gonna happen, but if the haxe one works then why not
class CppCodeGenerator {
	private var baseFilepath:String;
	private var baseNamespace:String;
	private var project:Project;
	
	// TODO library users can choose their own id/tag types for each class, could hardcode, or just let users name/assign to fields in the editor themselves (and hope their code compiles)
	public function new(baseFilepath:String, baseNamespace:String, project:Project) {
		this.baseFilepath = baseFilepath;
		this.baseNamespace = baseNamespace;
		this.project = project;
	}
	
	public function generate():Array<CodeFile> {
		return []; // TODO
	}
}
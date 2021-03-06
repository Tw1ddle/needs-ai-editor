package needs.code;

import needs.code.CodeFile;
import needs.model.ProjectData;

class HaxeCodeGenerator {
	private var baseFilepath:String;
	private var basePackage:String;
	private var project:ProjectData;
	
	// TODO library users can choose their own id/tag types for each class, could hardcode, or just let users name/assign to fields in the editor themselves (and hope their code compiles)
	public function new(baseFilepath:String, basePackage:String, project:ProjectData) {
		this.baseFilepath = baseFilepath;
		this.basePackage = basePackage;
		this.project = project;
	}
	
	public function generate():Array<CodeFile> {
		return []; // TODO
	}
}
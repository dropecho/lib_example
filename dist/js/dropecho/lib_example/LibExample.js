import {Register} from "../../genes/Register.js"

export const LibExample = Register.global("$hxClasses")["dropecho.lib_example.LibExample"] = 
class LibExample {
	static test() {
		console.log("src/dropecho/lib_example/LibExample.hx:6:","hello world.");
		return 2;
	}
	static get __name__() {
		return "dropecho.lib_example.LibExample"
	}
	get __class__() {
		return LibExample
	}
}


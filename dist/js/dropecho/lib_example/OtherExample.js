import {Register} from "../../genes/Register.js"

export const OtherExample = Register.global("$hxClasses")["dropecho.lib_example.OtherExample"] = 
class OtherExample extends Register.inherits() {
	new() {
		this.x = 0;
	}
	banana(b) {
		return b + 5 + this.x;
	}
	static get __name__() {
		return "dropecho.lib_example.OtherExample"
	}
	get __class__() {
		return OtherExample
	}
}


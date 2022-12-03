(function ($hx_exports, $global) { "use strict";
$hx_exports["dropecho"] = $hx_exports["dropecho"] || {};
$hx_exports["dropecho"]["lib_example"] = $hx_exports["dropecho"]["lib_example"] || {};
class dropecho_lib_$example_LibExample {
	static test() {
		console.log("src/dropecho/lib_example/LibExample.hx:6:","hello world.");
		return 2;
	}
}
$hx_exports["dropecho"]["lib_example"]["LibExample"] = dropecho_lib_$example_LibExample;
class dropecho_lib_$example_OtherExample {
	constructor() {
		this.x = 0;
	}
	banana(b) {
		return b + 5 + this.x;
	}
}
$hx_exports["dropecho"]["lib_example"]["OtherExample"] = dropecho_lib_$example_OtherExample;
class haxe_iterators_ArrayIterator {
	constructor(array) {
		this.current = 0;
		this.array = array;
	}
	hasNext() {
		return this.current < this.array.length;
	}
	next() {
		return this.array[this.current++];
	}
}
{
}
})(typeof exports != "undefined" ? exports : typeof window != "undefined" ? window : typeof self != "undefined" ? self : this, {});

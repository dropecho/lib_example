package dropecho.lib_example;

@:expose('OtherExample')
class OtherExample {
	public var x:Int;

	public function new() {
		this.x = 0;
	}

	public function banana(b:Int) {
		var bar = b;
		var baz = 5;

		return bar + baz + x;
	}
}

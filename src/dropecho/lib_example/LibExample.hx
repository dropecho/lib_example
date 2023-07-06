package dropecho.lib_example;

@:expose("LibExample")
class LibExample {
	public var x:Int;

	static public function test() {
		trace("hello world.");
		return 2;
	}
}

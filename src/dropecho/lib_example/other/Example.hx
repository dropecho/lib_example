package dropecho.lib_example.other;

/**
An example class in a sub-package, exposed to JavaScript under a nested
namespace as `example.Nested` via `@:expose`. The export name is independent
of the Haxe package, so you can shape the JS API however you like.
**/
@:expose("example.Nested")
class Example {
	/** A value carried on the instance. **/
	public var x:Int;

	/**
	Create a new `Example`.

	@param x The initial value for `x` (defaults to `0`).
	**/
	public function new(x:Int = 0) {
		this.x = x;
	}

	/**
	Add `amount` and a fixed offset of `5` to `x`.

	@param amount The value to add.
	@return `amount + 5 + x`.
	**/
	public function offsetSum(amount:Int):Int {
		return amount + 5 + x;
	}
}

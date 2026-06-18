package dropecho.lib_example;

/**
An example instance class, exposed to JavaScript as `OtherExample`.

Demonstrates a class with a constructor, a public field, and a method.
**/
@:expose("OtherExample")
class OtherExample {
	/** A value carried on the instance. **/
	public var x:Int;

	/**
	Create a new `OtherExample`.

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

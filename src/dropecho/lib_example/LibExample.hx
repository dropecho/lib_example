package dropecho.lib_example;

/**
An example static-utility class, exposed to JavaScript as `LibExample`.

This exists to demonstrate the multi-target build, the `@:expose` JS export
name, and the test setup. Replace it with your own library code.
**/
@:expose("LibExample")
class LibExample {
	/**
	Add two integers.

	@param a The first addend.
	@param b The second addend.
	@return The sum `a + b`.
	**/
	public static function add(a:Int, b:Int):Int {
		return a + b;
	}
}

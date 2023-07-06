import utest.Assert;
import dropecho.lib_example.OtherExample;

class SecondSuiteTests extends utest.Test {
	var field:OtherExample;

	// synchronous setup
	public function setup() {
		field = new OtherExample();
	}

	function test_field_equals_some_value_2() {
		Assert.equals(0, field.x);
	}

	function test_failure_example_2() {
		Assert.equals(1, 0);
	}
}

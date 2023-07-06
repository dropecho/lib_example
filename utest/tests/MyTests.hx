package tests;

import utest.Assert;
import dropecho.lib_example.OtherExample;

class MyTests extends utest.Test {
	var field:OtherExample;

	// synchronous setup
	public function setup() {
		field = new OtherExample();
	}

	function test_field_equals_some_value() {
		Assert.equals(0, field.x);
	}

	function test_failure_example() {
		Assert.equals(1, 0);
	}
}

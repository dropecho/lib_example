package;

import utest.Assert;
import dropecho.lib_example.OtherExample;

class OtherExampleTests extends utest.Test {
	var subject:OtherExample;

	// Runs before each `test_` method.
	public function setup() {
		subject = new OtherExample();
	}

	public function test_default_x_is_zero() {
		Assert.equals(0, subject.x);
	}

	public function test_offsetSum() {
		Assert.equals(8, subject.offsetSum(3));
	}

	public function test_offsetSum_uses_x() {
		Assert.equals(18, new OtherExample(10).offsetSum(3));
	}
}

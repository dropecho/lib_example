package;

import utest.Assert;
import dropecho.lib_example.LibExample;

// Auto-discovered by `dropecho.testing` because the class name ends in `Tests`.
class LibExampleTests extends utest.Test {
	public function test_add() {
		Assert.equals(5, LibExample.add(2, 3));
	}

	public function test_add_with_negative() {
		Assert.equals(-1, LibExample.add(2, -3));
	}
}

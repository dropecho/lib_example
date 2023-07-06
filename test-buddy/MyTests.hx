import dropecho.lib_example.OtherExample;
import buddy.*;

using buddy.Should;

// All test classes should now extend BuddySuite (not SingleSuite)
class MyTests extends BuddySuite {
	public function new() {
		describe("Using Buddy", {
			it("should be a great testing experience", {
				var foo = new OtherExample();
				foo.x.should.be(10);
			});
			it("should really make the tester happy", {
				var foo = new OtherExample();
				foo.x.should.be(0);
			});
		});
	}
}

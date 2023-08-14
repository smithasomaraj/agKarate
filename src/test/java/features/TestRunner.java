package features;

import com.intuit.karate.junit5.Karate;

public class TestRunner {


	@Karate.Test
	Karate runAll() {
		return Karate.run().relativeTo(getClass());
	}
	
//	@Karate.Test
//    Karate testCheckPhoneNumber() {
//        return Karate.run("createUser").relativeTo(getClass());
//    }
	
}

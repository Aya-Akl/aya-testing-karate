package examples.users;

import com.intuit.karate.junit4.Karate;
import cucumber.api.CucumberOptions;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
//@CucumberOptions(features = "classpath:examples/users/users-post.feature")
/*@CucumberOptions(features = {
        "classpath:examples/users/users-post.feature",
        "classpath:examples/users/users-get.feature"})*/
@CucumberOptions(features = "classpath:examples/users", tags = "~@ignore") //all will be run except ones tagged with ignore
public class UsersRunner {

    @BeforeClass
    public static void before() {
        System.setProperty("karate.env", "test");
    }

}
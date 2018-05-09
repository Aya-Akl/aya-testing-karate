package examples.github;

import com.intuit.karate.junit4.Karate;
import cucumber.api.CucumberOptions;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@CucumberOptions(features = "classpath:examples/github", tags = "~@ignore")
public class GitHubRunner {

    @BeforeClass
    public static void before() {
        System.setProperty("karate.env", "test");
    }
}

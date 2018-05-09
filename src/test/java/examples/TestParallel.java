package  examples;

import com.intuit.karate.cucumber.CucumberRunner;
import com.intuit.karate.cucumber.KarateStats;
import cucumber.api.CucumberOptions;
import static org.junit.Assert.assertTrue;
import org.junit.Test;

@CucumberOptions(tags = {"~@ignore"})
public class TestParallel {

    @Test
    public void testParallel() {
        //class is the root package
        //The second argument is the number of threads to use.
        KarateStats stats = CucumberRunner.parallel(getClass(), 5, "target/surefire-reports");
        assertTrue("scenarios failed", stats.getFailCount() == 0);
    }

}

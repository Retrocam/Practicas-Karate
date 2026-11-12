package examples.covid;

import com.intuit.karate.junit5.Karate;

public class validationRunner {
    @Karate.Test
    Karate validate() {
        return Karate.run("01-validation").relativeTo(getClass());
    }
}

package examples.pets;

import com.intuit.karate.junit5.Karate;

public class DeletePetRunner {
    @Karate.Test
    Karate updatePet() {
        return Karate.run("deletePet").relativeTo(getClass());
    }
}

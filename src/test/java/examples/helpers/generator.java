package examples.helpers;

import com.github.javafaker.Faker;

public class generator {
    
    public static String getName(){
        Faker faker = new Faker();
        return faker.name().fullName();
    }

    public static String getEmail(){
        Faker faker = new Faker();
        return faker.internet().emailAddress();
    }
    public static Integer getNumber(){
        Faker faker = new Faker();
        return faker.random().nextInt(1, 20);
    }
}

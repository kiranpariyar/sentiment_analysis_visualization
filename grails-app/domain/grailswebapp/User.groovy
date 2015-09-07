package grailswebapp

class User {

    static mapWith = "mongo"
    String firstName
    String lastName
    String username
    String password

    // constraints
    static constraints = {
        firstName blank:false;
        lastName  blank:false;
    }
}

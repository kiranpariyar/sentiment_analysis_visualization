package grailswebapp

class User {

    static mapWith = "mongo"
    String firstName
    String lastName
    String username
    String password
    String phoneNumber
    String address
    String role

    // constraints
    static constraints = {
        firstName blank:false
        lastName  blank:false
        password blank: false
        username blank: false
        role blank: false
    }
}

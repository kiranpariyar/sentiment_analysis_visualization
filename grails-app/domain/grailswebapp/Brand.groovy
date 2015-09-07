package grailswebapp

class Brand {

    static mapWith = "mongo"
    String brandName
    String searchTerm

    static constraints = {
        brandName(blank: false)
        searchTerm(blank: false)
    }

    static mapping = {
    }
}

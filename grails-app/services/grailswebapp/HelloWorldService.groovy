package grailswebapp

import grails.transaction.Transactional

@Transactional
class HelloWorldService {

    String serviceMethod() {
        return "Hello World"
    }
}

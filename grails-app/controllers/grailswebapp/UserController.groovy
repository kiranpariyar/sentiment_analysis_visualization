package grailswebapp

class UserController {


    def index(){
        redirect(action: "login")
    }

    def login () {
        render (view: "login")
    }

    def form(){
        render (view: "form")
    }

    def addUser(){
        def user = new User(params)
        user.save()
        println user.firstName
        render "successfully added user"
    }

    def successMessage(){
        render "Successfully added User"
    }

    def loginHandle = {
        if (params.username == "kiran" && params.password == "kiran") {
            // username and password match -> log in
            session.user = "kiran"
            redirect(controller:'main',action: "home")
        } else {
            flash.message = "User not found"
            redirect(controller:'dashboard',action: "summary")
        }
    }

    def logout = {
        session.invalidate()
        render(view: "login")
    }

}

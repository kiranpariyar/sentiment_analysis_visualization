package grailswebapp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TweetObjectController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TweetObject.list(params), model:[tweetObjectCount: TweetObject.count()]
    }

    def show(TweetObject tweetObject) {
        respond tweetObject
    }

    def create() {
        respond new TweetObject(params)
    }

    @Transactional
    def save(TweetObject tweetObject) {
        if (tweetObject == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tweetObject.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tweetObject.errors, view:'create'
            return
        }

        tweetObject.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tweetObject.label', default: 'TweetObject'), tweetObject.id])
                redirect tweetObject
            }
            '*' { respond tweetObject, [status: CREATED] }
        }
    }

    def edit(TweetObject tweetObject) {
        respond tweetObject
    }

    @Transactional
    def update(TweetObject tweetObject) {
        if (tweetObject == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tweetObject.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tweetObject.errors, view:'edit'
            return
        }

        tweetObject.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'tweetObject.label', default: 'TweetObject'), tweetObject.id])
                redirect tweetObject
            }
            '*'{ respond tweetObject, [status: OK] }
        }
    }

    @Transactional
    def delete(TweetObject tweetObject) {

        if (tweetObject == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        tweetObject.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'tweetObject.label', default: 'TweetObject'), tweetObject.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tweetObject.label', default: 'TweetObject'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

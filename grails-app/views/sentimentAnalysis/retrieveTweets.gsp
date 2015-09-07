<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 8/24/15
  Time: 1:26 PM
--%>

<g:each in="${tweets}" var="tweet">
    <p>${tweet.tweet} :  ${tweet.name} : ${tweet.brandName}</p>
</g:each>

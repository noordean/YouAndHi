# README

# YouAndHi
YouAndHi is an API that connects you and I together. It allows people to register, create group, add other users to the created groups, and interact withing the groups. YouAndHi promotes teamwork in an organization as group members can easily reach out to one another.

## Development
This app was developed using ruby on rails with postgres database.

## Technologies Used
* [Ruby:](https://www.ruby-lang.org/en/) Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.
* [Rails:](https://http://rubyonrails.org/) Ruby on Rails, or Rails, is a server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller framework, providing default structures for a database, a web service, and web pages
* [PostgreSQL:](https://www.postgresql.org/) PostgreSQL is a powerful, open source object-relational database system (ORDBMS) that offers modern database features such as complex queries, foreign keys, etc.

## Available Endpoints
1. <b>POST:</b> /users <br>
   <b>Payloads:</b>
      - username(string)
      - password(string)
      - email(string)
      - phone_number(string)

2. <b>POST:</b> /users/login <br>
   <b>Payloads:</b>
      - username(string)
      - password(string)

Note: The login token must be supplied in the request headers before accessing any of the following endpoints.

3. <b>GET:</b> /users <br>
   <b>Payloads:</b>
      - No payload

4. <b>POST:</b> /groups <br>
   <b>Payloads:</b>
      - group_name(string)
      - group_description(string)

5. <b>POST:</b> /messages <br>
   <b>Payloads:</b>
      - message_content(string)
      - group_id(integer)

6. <b>PUT:</b> /messages/:id <br>
   <b>Payloads:</b>
      - message_content(string)

7. <b>DELETE:</b> /messages/:id <br>
   <b>Payloads:</b>
      - No payload

8. <b>GET:</b> /users/groups <br>
   <b>Payloads:</b>
      - No payload
    
9. <b>GET:</b> /users/:id/status_posts <br>
   <b>Payloads:</b>
      - No payload

10. <b>POST:</b> /groups/:id/add_users <br>
   <b>Payloads:</b>
      - member(string)

11. <b>PUT:</b> /groups/:id <br>
   <b>Payloads:</b>
      - group_name(string)

12. <b>POST:</b> /status_posts <br>
   <b>Payloads:</b>
      - post(string)

13. <b>PUT:</b> /status_posts/:id <br>
   <b>Payloads:</b>
      - post(string)

14. <b>DELETE:</b> /status_posts/:id <br>
   <b>Payloads:</b>
      - No payload

15. <b>GET:</b> /status_posts/:id/status_comments <br>
   <b>Payloads:</b>
      - No payload

16. <b>POST:</b> /status_posts/:id/add_comment <br>
   <b>Payloads:</b>
      - comment(string)
    
17. <b>PUT:</b> /status_comments/:id <br>
   <b>Payloads:</b>
      - comment(string)

18. <b>DELETE:</b> /status_comments/:id <br>
   <b>Payloads:</b>
      - No payload

## Installation
- Clone this repository to have the app on your machine with ```git clone https://github.com/noordean/YouAndHi.git```
- Change directory to the app's root with ```cd YouAndHi```
- Pull the develop branch with ```git pull origin develop```
- Then run ```bundle install```  to install the dependencies
- Start the server with ```rails s```
- Then using postman, you can consume `an_endpoint` with ```http://localhost:3000/an_endpoint```

## How to Contribute
- Fork this repository.
- Clone it.
- Create your feature branch on your local machine with ```git checkout -b your-feature-branch```
- Push your changes to your remote branch with ```git push origin your-feature-branch```
- Open a pull request against the develop branch, and describe how your feature works

### Author
Nurudeen Ibrahim

# README

************************
###### Deployed App: 
https://i-recycle.herokuapp.com/

###### GitHub Repo: 
https://github.com/tessgard/rails-recycling-app/

![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/github.png "Github")


### Planning

![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/trello3.png "Trello")
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/Trello1.png "Trello")
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/Trello2.png "Trello")



### Need for the Project:  
        Recycling is the method in which a used product can be converted into a  different-usable product. But not always the products labelled as recycle are recycled. Most of the time they end up in landfill This Project "irecycle" is a portal to connect people who wanted to donate their products to businesses, which recycle these products and make them into something better. 
          

### Problem Addressed: 
        Recycling of products is under-rated, many don't care about recycling and even if they did, they don't follow through to see if their products are actually recycled. This project "irecycle" is mainly for the people who care to recycle their product. They can post their products in the portal and the business can buy from them. This way people can check if their products have actually been recycled instead of filling in the landfill


### Project Description:
        irecycle: The goal of this project is connect people who have things that can be recycled with business who recycle. People can simply signup in our website and can create posts of their project, they can attach images if they have and this information will be displayed in the market place, where the businesses can signup and view and purchase the products. After the business purchases the product, the customer can mail their products to the respective business address. Thus they can make sure that their products are actually recycled and not sumped in landfill


### Network Infrastructure:
        Networking Hardware:
          Routers
          Switches
          LAN cards
          Wireless routers
          Cables

        Networking Software:
          Network operations and management
          Operating systems
          Firewall
          Network security applications

        Network Services:
          T-1 Line
          DSL
          Satellite
          Wireless protocols
          IP addressing


### Software Used:
        Software to be used in the App are HTML5, CSS and ruby on rails version 2.5.1. 

        Ruby on Rails: 
          It is a server-side web application framework. Rails is a model–view–controller (MVC) framework, providing default structures for a database, a web service, and web pages. It encourages and facilitates the use of web standards such as JSON or XML for data transfer, HTML, CSS.
        HTML:
          It  is the standard markup language for creating web pages and web applications.
        CSS:
          It is a style sheet language used for describing the presentation of a document written in a markup language like HTML.


### Database Used:
        Database used was postgreSQL. It is an open source DBMS.  It can handle workloads ranging from single-machine applications to Web services or data warehousing with many concurrent users. It is the default database for macOS Server. It is ACID-compliant and transactional. It offers support for RDBMS features such as updatable and materialized views, triggers, foreign keys; functions and stored procedures.
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/database.png "Database")



### Production database setup for postgresql:
        Hostname :  This is the hostname or IP address of your database server.  
        Port  : This is the PostgreSQL port. If you didn't change the port when you installed Postgres, it will default to 5432.
        Database name : This is the name of your confluence database. 
        Username :  This is the username of your dedicated database user.
        Password  : This is the password for your dedicated database user.
          production:
             <<: *default
              database: recycling-app_production
              username: recycling-app
              password: <%= ENV['RECYCLING-APP_DATABASE_PASSWORD'] %>


### Architecture of the App:
        We used MVC Architecture. MVC stands for Model, View and Controller. MVC separates application into three components - Model, View and Controller.

        Model: Model represents shape of the data and business logic. It maintains the data of the application. Model objects retrieve and store model state in a database.

          Model is a data and business logic.

        View: View is a user interface. View display data using model to the user and also enables them to modify the data.

          View is a User Interface.

        Controller: Controller handles the user request. Typically, user interact with View, which in-turn raises appropriate URL request, this request will be handled by a controller. The controller renders the appropriate view with the model data as a response.

          Controller is a request handler.


### Abstractions in the App:
          Ruby on Rails: It provides a complete abstraction layer to build with. 
          
          ActiveRecord: SQL is used to communicate with databases, but Rails provides an alternative library, ActiveRecord, to generate the SQL. ActiveRecord does not form a complete abstraction layer since there are useful database actions it cannot do. So we needed both ActiveRecord for concise and clear code, and SQL for advanced queries.
          
          Domain name: The URL on the Internet is another abstraction layer, enabling an alphabetic name to be converted into the numeric IP address of the Web server.


### Third party services used in our App: 
          The third party services that were used include,
          Stripe: Stripe is a global online payment processor that is trusted by thousands of businesses across the globe

          Mailgun:Mailgun is an email automation service provided by Rackspace. It offers a complete cloud-based email service for sending, receiving and tracking email sent through your websites and applications.

          AWS:Amazon Web Services (AWS) is a secure cloud services platform, offering compute power, database storage, content delivery and other functionality to help businesses scale and grow.


### Data structure of Market place:
        The Products in the market place can be filtered using the categories and using location. User can also view all products and select from the display. All the products uploaded by the users are displayed and as and when the products are purchased, they are removed from the market place.


### Database Relationship:
        Business table has many products and transactions.
        Products table belongs to user and has foreign key for user and business.
        Users table has many products and transactions.
        Transactions belong to user,business and product and has foreign key for business and user.


### Relationship Model: 
        Businesses:   has_many :products
                      has_many :transactions

        Products:     references :user, index: true
                      references :business, index: true
                      has_one_attached :uploaded_image
                      belongs_to :user

        Users:        has_many :products
                      has_many :transactions
        Transactions: references :business, index: true
                      references :user, index: true
                      belongs_to :user
                      belongs_to :business
                      belongs_to :product


### Database Schema Design:
        ActiveRecord::Schema.define(version: 2019_05_03_015053) do

          # These are extensions that must be enabled in order to support this database
          enable_extension "plpgsql"

          create_table "active_storage_attachments", force: :cascade do |t|
            t.string "name", null: false
            t.string "record_type", null: false
            t.bigint "record_id", null: false
            t.bigint "blob_id", null: false
            t.datetime "created_at", null: false
            t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
            t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
          end

          create_table "active_storage_blobs", force: :cascade do |t|
            t.string "key", null: false
            t.string "filename", null: false
            t.string "content_type"
            t.text "metadata"
            t.bigint "byte_size", null: false
            t.string "checksum", null: false
            t.datetime "created_at", null: false
            t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
          end

          create_table "businesses", force: :cascade do |t|
            t.string "email", default: "", null: false
            t.string "encrypted_password", default: "", null: false
            t.string "reset_password_token"
            t.datetime "reset_password_sent_at"
            t.datetime "remember_created_at"
            t.datetime "created_at", null: false
            t.datetime "updated_at", null: false
            t.boolean "deactivated"
            t.index ["email"], name: "index_businesses_on_email", unique: true
            t.index ["reset_password_token"], name: "index_businesses_on_reset_password_token", unique: true
          end

          create_table "products", force: :cascade do |t|
            t.string "category"
            t.integer "quantity"
            t.string "location"
            t.datetime "created_at", null: false
            t.datetime "updated_at", null: false
            t.bigint "user_id"
            t.integer "business_id"
            t.index ["user_id"], name: "index_products_on_user_id"
          end

          create_table "transactions", force: :cascade do |t|
            t.bigint "user_id"
            t.bigint "business_id"
            t.bigint "product_id"
            t.datetime "created_at", null: false
            t.datetime "updated_at", null: false
            t.index ["business_id"], name: "index_transactions_on_business_id"
            t.index ["product_id"], name: "index_transactions_on_product_id"
            t.index ["user_id"], name: "index_transactions_on_user_id"
          end

          create_table "users", force: :cascade do |t|
            t.string "email", default: "", null: false
            t.string "encrypted_password", default: "", null: false
            t.string "reset_password_token"
            t.datetime "reset_password_sent_at"
            t.datetime "remember_created_at"
            t.datetime "created_at", null: false
            t.datetime "updated_at", null: false
            t.boolean "deactivated"
            t.index ["email"], name: "index_users_on_email", unique: true
            t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
          end

          add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
          add_foreign_key "products", "businesses"
          add_foreign_key "products", "users"
          add_foreign_key "transactions", "businesses"
          add_foreign_key "transactions", "products"
          add_foreign_key "transactions", "users"
        end


### User Stories:
        Story 1: As a user(Individual), I want to upload more than one product at the same time.
        Story 2: As a user(Business), I want to buy more than one product at the same time by adding them to the cart and paying only once the total amount.


### Wireframes: 
#### Figma screen grabs

##### Landing Page
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/landing_page.png "Landing Page")

##### Sign up
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/sign_up.png "Sign up")

##### User Dashboard
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/user_dash.png "User Dashboard")

##### New Product
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/new_product.png "New product")

##### Marketplace
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/Marketplace.png "Marketplace")
      

### Allocated and tracked tasks:
        Tasks are allocated using trello and it is allocated according to each team member. Every time each task is completed, it is moved to "Done" column.


### Agile methodology implemented in the project:
        We communicated with each other everyday in person, slack and git hub. Everytime we finish our task,we push it to git hub for the other person to check and commit changes. We worked as a team. Task for each person was allocated using trello, thus we both know what need to be done even if the other person is not around.


### Source control Process:
        Git is a source control system that keep track of the changes in your computer files and you may work together with multiple people. We used 
        command line interface to achieve this. Github is one of the online project hosting that use Git. A new repository with the name: recycling-app was created and everytime a change is done in any part of the program a new branch is created in github and the file with the changes is pushed to that branch. Once the changes are confirmed to work, the branch is merged with the master branch unless there is a conflict. If there is a conflict, then who ever has pushed the changes last, will have to fix the conflict and push again. So when the other person wanted to work will pull the project and any change made can be pulled and they can work on it, as long as they don't have any changes that they haven't commited and pushed. Else they will have to stash it and pull again. 
 

### Testing process:
        Testing process was not systematic, as we coded we checked our code was working on local server. Setting up test user logins and testing all features before commiting changes and pushing to GitHub.
        User testing sessions were run with non coding users which brought up some edge cases such as: 
                - there was an error raised if a product was created without an image
                - devise password validation was not working as it should
                - the was a state missing in the list of available locations
                - when items were "bought" in the marketplace they stayed available when they should become unavailable
        After the user testing session we were able to work on the above errors to ensure that our app was bug free.


### Information system security:
        Http is a stateless protocol and sessions make it stateful. A session ususally has hash of values and session ID and every cookie sent to the client's browser has a session ID and it is destroyed once the user logs out. Thus, the cookie serves as a temporary authentication for the web application. For this to hold, the user has to signup with user name and password and then the session ID is generated using SecureRandom.hex.


### Methods used to protect information and data: 
        To help prevent Cross-Site Scripting, we need to sanitise input which can be achieved by Model View Controller design.  Any data stored or retrieved from a database should pass through a Model, so this is a great place to sanitise our stored data. Using Active Record Validations within our models we can ensure that data is present and/or in a specific format. We can also sanitise input/output within the View using the sanitize method. It will encode all html tags and stripe all attributes that aren't specifically allowed. String output in the view are automatically encoded.
        Cross-Site Request Forgery attack can be prevented using authenticity_token.


### Legal obligations: 
        Care should taken that the personal information from customer should not be illegally disclosed or stolen. So we should collect only the required information from the customers. Once it is no longer needed it should be destroyed. The user's personal information has to be shared only on a need to know basis. All the software has to be up-to-date and should have proper anti-virus software. Password protection should be strong.


### Deployed app screengrabs
Landing page
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/deployed-landing-page.png "landing page")
Login 
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/deployed-login.png "login")
About
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/deployed-about-page.png "About")
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/deployed-about-page-2.png "About")
Individual user dashboard
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/deployed-user-dash.png "user dash")
New post 
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/deployed-new-post2.png "new post")
Show item 
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/deployed-show-item.png "show")
Business dashboard
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/deployed-business-dash.png "business dash")
Marketplace
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/deployed-marketplace.png "marketplace")
Stripe pop-up
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/deployed-stripe.png "stripe")
Admin user dashboard
![alt text](https://github.com/tessgard/rails-recycling-app/blob/master/recycling-app/deployed-admin-dash.png "admin dash")


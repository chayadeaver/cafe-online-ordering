# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
    I have five models: Category, Item_order, Item, Order, and User
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    User has_many orders and Category has_many Items
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Order belongs_to User and Item belongs_to Category
- [x] Include user accounts with unique login attribute (username or email)
    Use ActiveRecord Validation to validate email for uniqueness
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    The Order belongs to User has routes for Creating, Reading, Updating, and Destroying
- [x] Ensure that users can't modify content created by other users
    Created an authorization helper method to authorize users
- [x] Include user input validations
    Use ActiveRecord Validation to validate items for presence
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    I utilize flash messages and put it in the layout file so it will have the capability to display it on all the pages if needed
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
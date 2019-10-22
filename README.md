# README

In this step we will generate a model to create Product using following command:

###Step 1:
$>rails generate model Product title:string description:text price:integer

Above command will generate a `Products` model with migration for table `products` and its columns with respective types in one go .

Once command the above command is executed, run following command to create tables in db:

$>rails db:migrate

To check your table is working accordingly goto rails console like this:

$>rails c
In console try to create product like this :

rails-console>Product.create({title:'Apple',description:'Fresh Apple',price:5})

Once created, you can return all the products like this:

Product.all


###Step 2:

Lets create a seed file, because we would be needing a lots of data for manpulation:

For that we would be needing a `faker` gem

lets install it:

gem 'faker'

don't forget to run bundle install and then restart server.

###Step 3:
Now write code for generation 1000 products in seed file

db/seeds.rb



Lets do it!


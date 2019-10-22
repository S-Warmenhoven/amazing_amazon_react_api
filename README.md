# README

In this lab we will generate a migration to change column in Products table using following command:

###Step 1:
$>rails generate migration ChangeProductPriceToFloat

Above command will generate a skeleton change migration for table `products` and we will make final changes in migration .

Once command the above command is executed,

it will generate migration file in db>migration

 run following command to create tables in db:

$>rails db:migrate

To check your table is working accordingly goto rails console like this:

$>rails c
In console try to create product like this :

rails-console>Product.create({title:'Apple',description:'Fresh Apple',price:5.0})

Once created, you can return all the products like this:

Product.all



Lets do it!


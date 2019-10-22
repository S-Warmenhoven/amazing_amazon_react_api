# README

In this lab we will add vaildation to product model.

product.rb


product.errors.messages

###Step 1:

In console try to create product duplicate product like this :

rails-console>product=Product.create({title:'Apple',description:'Fresh Apple',price:5.0})

If it doesnot allow you to create product, use following to see validation errors

product.errors.messages



Lets do it!


# README

In this step we will generate controller using followint command:
###Step 1:
$>rails generate controller Welcome home about

Above command will generate a welcome controller with home and about action.

it will also generate view file in app>views>welcome>

view file are part of controller's action

###Step 2:
Then create routes for welcome controller

To view routes goto:

config>routes.rb

Add following:

root 'welcome#index' 
Here we are creating root route. Our app will start from this page (action)


get('/about', { to: 'welcome#about', as: :about })
This will redirect to /about if user will type localhost:3000/about in browsers address bars

Lets do it!


You are entering my first WEB Api website, welcome!

application description: The project is literally a shoe store.
It includes an identification page: new user has an option to register.
After identification, you have two options : update your personal identification information, 
or turn into a beautiful shoe store.
 In the store you can add products to a personal cart.
 The products that where added into the cart are now saved in a session storage.
Product Search: you can define product classification :product category, filter words from  product description, or filter price according to your budget into the "minimum" or "maximum" price fields.
You can also use a button "personal products page", where you can see your cart with the products you have selected, you can remove chosen products ,watch your total payment account, and save your order.

The site was written : on server side - ASP.NET 7. On client side - JS.

The project uses WEB API, and is based on REST technology. For the password security: I used the zxcvbn-core package which checks the password strength,
In the user registration, and updating user information. The layers are connected to DI, so that my application will be flexible and easy to change. I've used async/await along the way, to make sure my app has the scalability advantage. The database is SQL and communication with it was done using Microsoft ORM - EF.
 I worked with:DB first . I have a swagger that describes my project structure. I added a DTO layer in order to avoid circular dependencies, the objects are mapped by the AutoMapper package. I used configuration files to manage environment settings. I used an activity logger that writes to a file when  login action accures, and sends an email when there is an attempt of changing the amount of the order.

MiddleWares: I wrote 2 custom middleWares for the project, one that puts each request details in the DB, and another which is in charge on error handling, as is written beneath.

Validation and error handling: I used entity validation. The errors are written to the log, and the user gets just an internal error.

In order to run the app, you need: vs version 2022. DB-SQL.
To create the DB, you can use code first abilities
To get started: Open your package manager console,

Write: 1. Add-Migration [MyDataBaseName] 2.Update-DataBase. the DB is ready!


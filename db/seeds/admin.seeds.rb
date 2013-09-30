# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Static Define Users data for all the Privilage user in the Users Table
Users.create(user_firstName: 'Tamanon',
             user_lastName:'Virulhakieat',
             user_email:'tamanon.v@gmail.com',
             user_type: 'Admin',
             user_password:"$2a$10$CLcRGvTILtZocw12prJdRuJ1tJpNHd0VMi8ADt9neBm1fvZyv/5vi",
             userExpirationDate:'2100-12-31')

Users.create(user_firstName: 'Steven',
             user_lastName:'Rahn',
             user_email:'sjrahn.v@gmail.com',
             user_type: 'Client',
             user_password: "steven",
             userExpirationDate:'2100-12-31')

Users.create(user_firstName: 'test',
	       user_lastName:'Rahn',
             user_email:'test@gmail.com',
             user_type: "Admin",
             user_password: "testlol", #test
             userExpirationDate:'2100-12-31')

Users.create(user_firstName: "Colin",
             user_lastName: "something",
             user_email: "colin@gmail.com",
             user_type: "Admin",
             user_password: "test",
             userExpirationDate: "2100-12-31")
# End Static define Users Table
 
# Static Define Restaurant data for all the Privilage user in the Users Table
# End Static define User Table

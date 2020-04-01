// import 'package:flutter/material.dart';

class PersonalDatabase {
  String firstName, lastName, address, city, zipcode, state, email; 

  //PersonalDatabase({ this.fullname, this.email, this.streetaddress, this.city, this.zipcode, this.state});
   PersonalDatabase(String fi, String la, String ad, String ci, String zi, String st, String em){
     firstName = fi;
     lastName = la;
     address = ad;
     city = ci;
     zipcode = zi;
     state = st;
     email = em;
   }
}

List<PersonalDatabase> pastComments = [
  //PersonalDatabase(firstName: 'John', lastName: 'Doe', address: '123 teststreet', city: 'testcity', zipcode: '12345', state: 'teststate', email: 'test@yahoo.com'), 
];
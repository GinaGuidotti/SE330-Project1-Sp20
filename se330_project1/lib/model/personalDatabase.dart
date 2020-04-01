// import 'package:flutter/material.dart';

class PersonalDatabase {
  String fullname, email, streetaddress, city, zipcode, state; 

  //PersonalDatabase({ this.fullname, this.email, this.streetaddress, this.city, this.zipcode, this.state});
   PersonalDatabase(String fn, String em, String ad, String ci, String zi, String st){
     fullname = fn;
     email = em;
     streetaddress = ad;
     city = ci;
     zipcode = zi;
     state = st;
   }
}

List<PersonalDatabase> pastComments = [
  //PersonalDatabase(fullname: 'testname', email: 'test@yahoo.com', streetaddress: '123 teststreet', city: 'testcity', zipcode: '12345', state: 'teststate'), 
];
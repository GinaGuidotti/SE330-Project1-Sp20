// import 'package:flutter/material.dart';

class EmailDatabase {
  String email, comment; 

  //EmailDatabase({ this.email, this.comment});
   EmailDatabase(String em, String co){
     email = em;
     comment = co;
   }
}

List<EmailDatabase> pastComments = [
  //EmailDatabase(email: 'test@yahoo.com', comment: "this is a comment here"), 
];
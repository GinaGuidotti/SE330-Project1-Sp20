import 'package:flutter/material.dart';

class EmailDatabase {
  String firstName, lastName, email, comment; 

  EmailDatabase({this.firstName, this.lastName, this.email, this.comment});
}

List<EmailDatabase> pastComments = [
  EmailDatabase(firstName: "first", lastName: "boop", email: 'test@yahoo.com', comment: "this is a comment here"), 
];
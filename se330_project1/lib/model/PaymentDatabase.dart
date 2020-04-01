
import 'package:intl/intl.dart';

class PaymentData {
  String  streetAddress, city, state, zipCode, creditNumber, cvv, nameOnCard;
  DateFormat expirationDate; 

  //EmailDatabase({ this.email, this.comment});
   PaymentData(String ad, String ct, String st, String zp, String cn, String cv, String nm, DateFormat ex){
     streetAddress = ad;
     city = ct;
     state = st;
     zipCode = zp;
     creditNumber = cn;
     cvv = cv;
     nameOnCard = nm;
     expirationDate = ex;
   }
}

List<PaymentData> pastComments = [
  //EmailDatabase(email: 'test@yahoo.com', comment: "this is a comment here"), 
];
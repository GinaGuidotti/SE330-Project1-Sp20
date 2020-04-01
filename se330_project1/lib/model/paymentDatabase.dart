import 'package:intl/intl.dart';

class PaymentData {
  String  streetAddress, city, state, zipCode, creditNumber, cvv, nameOnCard, expirationDate;
 
   PaymentData(String ad, String ct, String st, String zp, String cn, String cv, String nm, String ex){
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

List<PaymentData> paymentInfo = [
  
];
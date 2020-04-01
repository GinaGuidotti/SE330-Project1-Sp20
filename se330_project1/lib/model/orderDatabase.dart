import 'package:intl/intl.dart';

class OrderData {
  String fullName, streetAddress, city, state, zipCode, creditNumber, cvv, nameOnCard, expirationDate;
  String orderNumber;
 
   OrderData(String fn, String ad, String ct, String st, String zp, String cn, String cv, String nm, String ex){
     fullName = fn;
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

List<OrderData> orderInfo = [
  
];
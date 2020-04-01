import 'package:flutter/material.dart';  
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';
import 'package:se330_project1/main.dart';
import 'package:se330_project1/screens/Cart.dart';
import 'package:se330_project1/model/personalDatabase.dart';
import 'package:se330_project1/screens/PaymentInput.dart';

class PersonalInfo extends StatefulWidget { 
  @override
  createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfo>{
  String firstName, lastName, address, city, zipcode, state, email;

  Future navigateBackToCart(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
  }

  Future navigateForwardToPaymentInfo(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentInfo()));
  }

  Widget buildRow(Widget widg1, Widget widg2){
    return ListTile(leading: widg1, title: widg2,);
  }

  Widget build(BuildContext context) {   
   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.height;
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle bigStyle = TextStyle(fontSize: screenWidth*0.07, color: Colors.black);
    TextStyle whiteStyle = TextStyle(fontSize: screenWidth*0.06, color: Colors.white);  

    final backAPageButton = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.2, 
        onPressed: () {            
          navigateBackToCart(context);
        },
        child: Icon(Icons.chevron_left, color: Colors.white, size: screenWidth*0.06),
      ),
    );

    final continueButton = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.8, 
        onPressed: () {           
          pastPersonelInfo.add(new PersonalDatabase(firstName, lastName, address, city, zipcode, state, email)) ;
          navigateBackToCart(context);
        },
        child: Text('Continue to Payment Info', style: whiteStyle),
      ),
    );
    

    final firstNameField = TextField(
      onChanged: (String value){ 
        firstName = value;
      }, 
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "First Name",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final lastNameField = TextField(
      onChanged: (String value){ 
        lastName = value;
      }, 
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Last Name",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    
    final addressField = TextField(
      onChanged: (String value){ 
        address = value;
      }, 
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Street Address",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final cityField = TextField(
      onChanged: (String value){ 
        city = value;
      }, 
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "City",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final zipCodeField = TextField(
      onChanged: (String value){ 
        zipcode = value;
      }, 
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "ZipCode",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final stateField = TextField(
      onChanged: (String value){ 
        state = value;
      }, 
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "State",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final emailField = TextField(
      onChanged: (String value){ 
        email = value;
      }, 
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

     return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
        backgroundColor: DarkCyan,
      ),
      //drawer: CollapsingNavigationDrawer(),
      body: ListView(
        children: <Widget>[
          SizedBox(height: screenWidth*0.04,),
          Text('  Full Name ', style: style, textAlign: TextAlign.center),
          SizedBox(height: screenWidth*0.04,),
          firstNameField, 
          SizedBox(height: screenWidth*0.02,),
          lastNameField,
          SizedBox(height: screenWidth*0.01,),
          Divider(height: 20, color: DarkCyan, thickness: 3.0,), 
          SizedBox(height: screenWidth*0.02,),
          Text('  Mailing Address ', style: style, textAlign: TextAlign.center,),
          SizedBox(height: screenWidth*0.04,),
          addressField,
          SizedBox(height: screenWidth*0.04,),
          cityField,
          SizedBox(height: screenWidth*0.02,),
          zipCodeField,
          SizedBox(height: screenWidth*0.02,),
          stateField,
          SizedBox(height: screenWidth*0.02,),
          emailField,
          SizedBox(height: screenWidth*0.02,), 
          SizedBox(height: screenWidth*0.1,),

        ],
      ),
      bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            backAPageButton,             
            continueButton,
          ],
        ),
    ); 
  }

}

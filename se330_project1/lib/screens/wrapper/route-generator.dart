
// import 'package:ecc_flutter/screens/calendar/bloc/calendar_bloc.dart';
// import 'package:ecc_flutter/screens/calendar/calendar.dart';
// import 'package:ecc_flutter/screens/duedates/duedates.dart';
import 'package:se330_project1/screens/aboutus.dart';
import 'package:se330_project1/screens/home.dart'; 
// import 'package:ecc_flutter/screens/review&submit/review.dart';
// import 'package:ecc_flutter/screens/review&submit/submit.dart';
// import 'package:ecc_flutter/screens/changepassword/changepassword.dart';
// import 'package:ecc_flutter/screens/notifications/bloc/notifications_bloc.dart';
// import 'package:ecc_flutter/screens/notifications/notifications.dart';
// import 'package:ecc_flutter/screens/logout/logout.dart';
import 'package:se330_project1/screens/wrapper/bloc/header_bloc.dart';
import 'package:se330_project1/screens/wrapper/screen_header.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  // final CalendarBloc calendarBloc;
  final HeaderBloc headerBloc;
  // final AuthBloc authBloc;
  // final NotificationsBloc notificationsBloc;
  // RouteGenerator({this.calendarBloc, this.headerBloc, this.authBloc, this.notificationsBloc});
     RouteGenerator({this.headerBloc});

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
       
      case '/homepage':
        headerBloc.add(ChangeHeader(header: HomePageHeader()));
        print('HomePage?');
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
        break;
      case '/shopping':
        headerBloc.add(ChangeHeader(header: ShoppingHeader()));
        print('Shopping?');
        // return MaterialPageRoute(
        //   builder: (_) => HomePage(),
        // );
        break;
      case '/favorites':
        headerBloc.add(ChangeHeader(header: FavoritesHeader()));
        print('Favorites?');
        // return MaterialPageRoute(
        //   builder: (_) => HomePage(),
        // );
        break;
      case '/saved':
        headerBloc.add(ChangeHeader(header: SavedHeader()));
        print('Saved?');
        // return MaterialPageRoute(
        //   builder: (_) => HomePage(),
        // );
        break;  
      case '/aboutus': 
        headerBloc.add(ChangeHeader(header: AboutUsHeader()));        
        print('AboutUs?');
        return MaterialPageRoute(
          builder: (_) => AboutUs(),
        );
        break;  
      default:
        return errorRoute();
    }
    return errorRoute();
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
 
import 'package:se330_project1/screens/wrapper/route-generator.dart'; 
import 'package:se330_project1/screens/wrapper/bloc/header_bloc.dart';
import 'package:se330_project1/sidebar/bloc/sidebar_bloc.dart';
import 'package:se330_project1/sidebar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey<NavigatorState> bodyNavigatorKey = GlobalKey<NavigatorState>();

class Wrapper extends StatelessWidget {
  Widget build(BuildContext wrapperContext) {  
    final screenWidth = MediaQuery.of(wrapperContext).size.width; 
     final HeaderBloc headerBloc = BlocProvider.of<HeaderBloc>(wrapperContext);
     final SidebarBloc sidebarBloc = BlocProvider.of<SidebarBloc>(wrapperContext); 
    final RouteGenerator bodyGenerator = RouteGenerator();
    return BlocBuilder<HeaderBloc, HeaderState>(
              builder: (context, headerState) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(
                      headerState.currentHeader.headerText,
                      style: TextStyle(
                        fontFamily: 'Hiragino Mincho ProN',
                      )
                    ),
                    leading: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        print('Clicked the Sidebar');
                        sidebarBloc.add(ToggleSidebar());
                      }
                    )
                  ),
                  body: Stack(
                    children: <Widget>[
                      Navigator(
                        key: bodyNavigatorKey,
                        onGenerateRoute: bodyGenerator.generateRoute,
                        initialRoute: '/homepage',
                      ),
                      Sidebar(screenWidth: screenWidth)
                    ],
                  ),
                );    
        }     
    );
    }
    }

  enum ThemeEvent { toggle }

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  @override
  ThemeData get initialState => ThemeData.light();

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.toggle:
        yield state == ThemeData.dark() ? ThemeData.light() : ThemeData.dark();
        break;
    }
  }
}
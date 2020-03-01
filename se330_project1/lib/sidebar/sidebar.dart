import 'package:se330_project1/globalvariables.dart'; 
import 'package:se330_project1/sidebar/bloc/sidebar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:se330_project1/screens/wrapper/wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Sidebar extends StatefulWidget {
  final screenWidth;
  Sidebar({this.screenWidth});
  final sidebarTopItems = [
    {
      'name': 'Home',
      'path': '/homepage'
    },
    {
      'name': 'Shop List',
      'path': '/shopping'
    }, 
    {
      'name': 'Favorites',
      'path': '/favorites'
    },
    {
      'name': 'Saved',
      'path': '/saved'
    },
  ];

  final sidebarBottomItems = [
    {
      'name': 'About Us',
      'path': '/aboutus'
    },
    // {
    //   'name': 'Account',
    //   'path': '/account'
    // },  
  ];


  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState 
  extends State<Sidebar> with SingleTickerProviderStateMixin{
  double minWidth = -5.0;
  double maxWidth;
  AnimationController _animationController;
  Animation<double> widthAnimation;

  @override
  void initState() {
     print('Inside Sidebar.dart inside initState');
    super.initState();
    maxWidth = widget.screenWidth * 0.45;
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    widthAnimation = Tween<double>(begin: minWidth, end: maxWidth).animate(_animationController);
     print('Inside Sidebar.dart inside initState end');
  }

  Widget getWidget(context, widget) {
    final screenHeight = MediaQuery.of(context).size.height;
    SidebarBloc sidebarBloc = BlocProvider.of<SidebarBloc>(context);
    return BlocListener<SidebarBloc, SidebarState>(
      listener: (context, state) {
        if (state is SidebarDisplayed) {
          print('Inside Sidebar.dart line 67');
          _animationController.forward();
        } else if (state is SidebarHidden) {
          _animationController.reverse();
        }
      },
      child: Positioned(
        right: widget.screenWidth - widthAnimation.value,
        child: Container(
          width: maxWidth,
          height: screenHeight - AppBar().preferredSize.height * 1.5,
          decoration: BoxDecoration(
            color: DarkCyan,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
              )
            ],
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15.0),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB((screenHeight * 0.02) * (screenHeight * 0.001), 0.0, 0.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, (screenHeight * 0.03) * (screenHeight * 0.001), 0.0, 0.0),
                    child: buildSidebarItems(context, widget.sidebarTopItems),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      buildSidebarItems(context, widget.sidebarBottomItems),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) => getWidget(context, widget)
    );
  }

  Widget buildSidebarItems(BuildContext context, List sidebarItems) {
    SidebarBloc sidebarBloc = BlocProvider.of<SidebarBloc>(context); 
    double screenHeight = MediaQuery.of(context).size.height;
    List<Widget> itemList = <Widget>[];
    sidebarItems.forEach((item) {
      itemList.add(
        FlatButton(
          onPressed: () {
            bodyNavigatorKey.currentState.pushReplacementNamed(
              item['path'],
            );
            setState(() {
              sidebarBloc.add(ToggleSidebar());
            });
          },
          child: Container(
            child: Text(
              item['name'],
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Hiragino Mincho ProN',
                fontSize: widget.screenWidth * 0.047 ,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
      itemList.add(Divider(height: (screenHeight * 0.03) * (screenHeight * 0.001)));
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: itemList
    );
  }
}

class BodyNavigationArguments {
  final BuildContext blocContext;
  BodyNavigationArguments({this.blocContext});
}
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:se330_project1/screens/Saved.dart';
import 'package:se330_project1/screens/Shopping.dart';
import 'package:se330_project1/screens/Favorites.dart'; 
import 'package:se330_project1/screens/ContactUs.dart';
import 'package:se330_project1/screens/home.dart';
import 'package:se330_project1/screens/ErrorPage.dart';
import 'package:se330_project1/screens/Cart.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 200;
  double minWidth = 75;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 100));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) { 
   double screenHeight = MediaQuery.of(context).size.height; 
    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        color: DarkCyan,
        child: Column(
          children: <Widget>[
            SizedBox(height: screenHeight*0.1,),
            CollapsingListTile(title: 'Just Clicked', icon: Icons.camera, animationController: _animationController,),
            Divider(color: Colors.grey, height: screenHeight*0.01,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(height: screenHeight*0.015);
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                      onTap: () {
                        setState(() {
                          currentSelectedIndex = counter;
                        });
                        // print('\nSelected Item #: ' + currentSelectedIndex.toString());
                        // print('Path: ' + navigationItems[counter].path);
                        if(counter == 0 ){ //Home Page
                          // print('Home Page');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),  
                         );
                        }else if(counter == 1 ){ //Shopping Page
                          // print('Shop Page');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Shopping()),
                         );
                        }else if(counter == 2 ){ //Fav Page
                          // print('Fav Page');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Favorites()),
                         );
                        }else if(counter == 3 ){ //Saved Page
                          // print('Saved Page');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Saved()),
                         );
                        }else if(counter == 4 ){ //Cart Page
                          // print('Cart Page');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Cart()),
                         );
                        }else if(counter == 5 ){ //AboutUs Page
                          // print('Contact Us Page');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ContactUs()),
                         );
                        }else{
                          // print('Error Page');
                           Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ErrorPage()),
                         );
                        }
                        
                      },
                      isSelected: currentSelectedIndex == counter,
                      title: navigationItems[counter].title,
                      icon: navigationItems[counter].icon,
                      animationController: _animationController,
                  );
                },
                itemCount: navigationItems.length,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.arrow_menu,
                progress: _animationController,
                color: Cyan,
                size: screenHeight*0.07,
              ),
            ),
            SizedBox(
              height: screenHeight*0.03
            ),
          ],
        ),
      ),
    );
  }
}
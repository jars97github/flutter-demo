import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/my_service.dart';
import 'package:flutter_application_1/widgets/customAppBar/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/customBottomBar/custom_bottom_bar.dart';
import 'package:flutter_application_1/widgets/customDrawer/custom_drawer.dart';
import './constants.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  HomePageState createState() => HomePageState();

}

class HomePageState extends State<Home>{
  final GlobalKey _scaffoldKey = GlobalKey();
  int _selectedTab = 0;
  final MyService _myService = MyService();
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: const CustomAppBar(),
        body: Constants.pages[_selectedTab],
        drawer:  CustomDrawer(user: _myService.user.username, email: _myService.user.email),
        bottomNavigationBar :  CustomBottomBar(currentIndex : _selectedTab,onTap : (index) => _changeTab(index)),
    );
  }
  
}
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:netclan_explorer/utlis/drawer.dart';
import 'package:netclan_explorer/view/explore.dart';
import 'package:netclan_explorer/view/otherscreen.dart';
import 'package:netclan_explorer/view/refine.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }
  final List<Widget> screens = [
    RefineScreen(),
    const ExploreScreen(),
    const NetworkScreen(),
    const chatScreen(),
    const ContactScreen(),


    // Add more screens for each tab as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF0E2334),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _openDrawer, // Call the _openDrawer() method
        ),
      ),
      drawer: const AppDrawer(),
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        height: 65,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black26)],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            duration: const Duration(milliseconds: 800),
            tabBackgroundColor: Colors.grey,
            tabs: const [
              GButton(icon: Icons.checklist, text: 'Refine', textStyle: TextStyle(fontSize: 12)),
              GButton(icon: Icons.remove_red_eye_outlined, text: 'Explore', textStyle: TextStyle(fontSize: 12)),
              GButton(icon: Icons.connect_without_contact_sharp, text: 'Network', textStyle: TextStyle(fontSize: 12)),
              GButton(icon: Icons.chat_bubble_outline_outlined, text: 'Chat', textStyle: TextStyle(fontSize: 12)),
              GButton(icon: Icons.contact_page_outlined, text: 'Contacts', textStyle: TextStyle(fontSize: 12)),
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) => setState(() => selectedIndex = index),
          ),
        ),
      ),


    );
  }
}

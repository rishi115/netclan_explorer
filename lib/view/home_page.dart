import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer(); // Open the drawer with animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFF0E2334),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _openDrawer, // Call the _openDrawer() method
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle drawer item tap
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle drawer item tap
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [BoxShadow(blurRadius: 20, color: Colors.black26)],
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
            tabs: [
              GButton(icon: Icons.checklist, text: 'Refine', textStyle: TextStyle(fontSize: 12)),
              GButton(icon: Icons.remove_red_eye_outlined, text: 'Explore', textStyle: TextStyle(fontSize: 12)),
              GButton(icon: Icons.connect_without_contact_sharp, text: 'Connect', textStyle: TextStyle(fontSize: 12)),
              GButton(icon: Icons.chat_bubble_outline_outlined, text: 'Chat', textStyle: TextStyle(fontSize: 12)),
              GButton(icon: Icons.contact_page_outlined, text: 'Contact', textStyle: TextStyle(fontSize: 12)),
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) => setState(() => selectedIndex = index),
          ),
        ),
      ),
    );
  }
}

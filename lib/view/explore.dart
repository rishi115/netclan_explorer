import 'package:flutter/material.dart';
import 'package:netclan_explorer/tabs/network.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            color: Color(0xFF1B3C59),
            child: TabBar(
              indicator: const BoxDecoration(
                color: Color(0xFF1B3C59),
                border: Border(
                bottom : BorderSide(
                  color: Colors.white,
                  width: 2,

                ),
                ),
              ),

              controller: _tabController,
              unselectedLabelColor: Colors.grey,

              labelColor: Colors.white,
              tabs: const [
                Tab(icon: Icon(Icons.perm_identity_outlined,)),
                Tab(icon: Icon(Icons.business_center)),
                Tab(icon: Icon(Icons.add_business_sharp)),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                NetworkScreen(),
                NetworkScreen(),
                NetworkScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

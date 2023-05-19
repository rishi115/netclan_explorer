import 'package:flutter/material.dart';
import 'package:netclan_explorer/utlis/scrolldatat.dart';

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({Key? key}) : super(key: key);

  @override
  _NetworkScreenState createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          controller: _scrollController,
          children: [
            SizedBox(height: 9),
            Row(
              children: [
                SizedBox(width: 30),
                Expanded(
                  child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.search, color: Colors.grey),
                        ),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 13),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {

                  },
                ),
                SizedBox(width: 14),
              ],
            ),
            SizedBox(height: 2),
            UserProfileWidget(
              name: 'Rishi ',
              status: 'Navi Mumbai',
              aboutText: 'HI Community i am new to netclan.',
              profileImageUrl: 'https://tse1.mm.bing.net/th?id=OIP.WQvPJdjEpvh8OTXB-NBfJwHaHw&pid=Api&P=0&h=180',
            ),


            UserProfileWidget(
              name: 'John Doe',
              status: 'Online',
              aboutText: 'I am a software engineer with a passion for coding.',
              profileImageUrl: 'https://bestprofilepictures.com/wp-content/uploads/2021/08/Amazing-Profile-Picture-for-Facebook.jpg',
            ),
            UserProfileWidget(
              name: 'John Doe',
              status: 'Online',
              aboutText: 'I am a software engineer with a passion for coding.',
              profileImageUrl: 'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
            ),


          ],
        ),
      ),
    );
  }
}

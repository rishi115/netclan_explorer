import 'package:flutter/material.dart';
import 'package:netclan_explorer/utlis/invitebutton.dart';
import 'package:netclan_explorer/utlis/testubewidget.dart';

class UserProfileWidget extends StatelessWidget {
  final String name;
  final String status;
  final String aboutText;
  final String profileImageUrl;

  const UserProfileWidget({
    required this.name,
    required this.status,
    required this.aboutText,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.5),
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFF173148).withOpacity(0.1),
            ],
            stops: [0.0],
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7, top: 0),
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                    HorizontalTubeWidget(
                      fillPercentage: 20,
                      fillColor: Color(0xFF3D6A91),
                    ),
                    SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        status,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),




                  ],
                ),
                SizedBox(width: 60,),
                Center(child: AnimatedInviteText()),
              ],

            ),
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Text(
                'Coffee | Business',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 4),
            Text(
              aboutText,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

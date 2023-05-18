import 'package:flutter/material.dart';
import 'package:netclan_explorer/utlis/purpose.dart';


class Option {
  final String text;
  final int index;

  Option({required this.text, required this.index});
}

class RefineScreen extends StatefulWidget {
  RefineScreen({Key? key}) : super(key: key);

  @override
  _RefineScreenState createState() => _RefineScreenState();
}

class _RefineScreenState extends State<RefineScreen> {
  Option? selectedOption;
  double sliderValue = 50;

  final TextEditingController textController = TextEditingController(text: 'Hi Community ! I am open to new community ');

  late List<Option> options;
  String selectedPurpose = '';
  List<String> purposes = ['Coffee', 'Business', 'Hobbies', 'Friendship', 'Movies', 'Dinning', 'Dating', 'Matrimony'];

  @override
  void initState() {
    super.initState();
    options = [
      Option(text: 'Available| Hey Let Us Connect', index: 0),
      Option(text: 'Away | Stay Discreet And Watch', index: 1),
      Option(text: 'Busy | Do Not Disturb Will Catch Up Later', index: 2),
      Option(text: 'SOS Emergency! Need Assistance! HELP', index: 3),
    ];
    selectedOption = options[0]; // Assign the second option as the selected option
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2,width: 19,),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 4,),
                  Text(
                    'Select Your Availability',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Stack(
              children: [
                Container(

                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonFormField<Option>(
                    value: selectedOption,
                    items: options.map((option) {
                      return DropdownMenuItem<Option>(
                        value: option,
                        child: Text(option.text),
                      );
                    }).toList(),
                    onChanged: (Option? value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (selectedOption != null)
                  Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        selectedOption!.text,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 14),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 4,),
                  Text(
                    'Add Your Status',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),

              child: TextField(
                maxLines: 3,
                maxLength: 250,
                controller: textController,
                decoration: InputDecoration(

                  hintText: 'Type your status here',
                  border: InputBorder.none,

                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 4,),
                  Text(
                    'Select Hyper Local Distance',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),const SizedBox(height: 16),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(

                trackHeight: 5, // Adjust the height of the slider track
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6), // Adjust the size of the slider thumb
              ),

              child: Slider(

                value: sliderValue,
                min: 0,
                max: 100,
                onChanged: (newValue) {
                  setState(() {
                    sliderValue = newValue;
                  });
                },
                divisions: 100,
                label: sliderValue.toString(),
                activeColor: Color(0xFF173148), // Set the active color of the slider
                inactiveColor: Colors.grey, // Set the inactive color of the slider
              ),



            ),
            Row(

              children: [
                SizedBox(width: 22,),
                Text(
                  "0 kM",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 95,),
                Container(

                  width: 45,
                  height: 33,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Center(
                    child: Text(
                      sliderValue.round().toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(width: 95,),


                Text(
                  "100 KM",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 14,),
                const Text(
                  'Select Purpose',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
        Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 10,),
                PurposeContainer(
                  purpose: purposes[0],
                  isSelected: selectedPurpose == purposes[0],
                  onTap: () {
                    setState(() {
                      selectedPurpose = purposes[0];
                    });
                  },
                ),
                SizedBox(width: 6,),
                PurposeContainer(
                  purpose: purposes[1],
                  isSelected: selectedPurpose == purposes[0],
                  onTap: () {
                    setState(() {
                      selectedPurpose = purposes[0];
                    });
                  },
                ),
                SizedBox(width: 6,),

                PurposeContainer(
                  purpose: purposes[2],
                  isSelected: selectedPurpose == purposes[0],
                  onTap: () {
                    setState(() {
                      selectedPurpose = purposes[0];
                    });
                  },
                ),
                SizedBox(width: 6,),
                PurposeContainer(
                  purpose: purposes[3],
                  isSelected: selectedPurpose == purposes[0],
                  onTap: () {
                    setState(() {
                      selectedPurpose = purposes[0];
                    });
                  },
                ),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 6,),

                PurposeContainer(
                  purpose: purposes[4],
                  isSelected: selectedPurpose == purposes[0],
                  onTap: () {
                    setState(() {
                      selectedPurpose = purposes[0];
                    });
                  },
                ),SizedBox(width: 6,),
                PurposeContainer(
                  purpose: purposes[5],
                  isSelected: selectedPurpose == purposes[0],
                  onTap: () {
                    setState(() {
                      selectedPurpose = purposes[0];
                    });
                  },
                ),SizedBox(width: 6,),
                PurposeContainer(
                  purpose: purposes[6],
                  isSelected: selectedPurpose == purposes[0],
                  onTap: () {
                    setState(() {
                      selectedPurpose = purposes[0];
                    });
                  },
                ),SizedBox(width: 6,),
                PurposeContainer(
                  purpose: purposes[7],
                  isSelected: selectedPurpose == purposes[0],
                  onTap: () {
                    setState(() {
                      selectedPurpose = purposes[0];
                    });
                  },
                ),


              ],
            ),



          ],
        ),
            Container(
                height: 115,
                width: 350,

                child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Function to execute when the button is pressed
                        // Add your code here
                      },

                      style: ElevatedButton.styleFrom(

                        shape: RoundedRectangleBorder(


                          borderRadius: BorderRadius.circular(25), // Match the border radius of the container
                        ),
                        padding: EdgeInsets.only(right: 30,left: 30,top: 10,bottom: 10),
                        backgroundColor: Color(0xFF1B3C59),
                      ),
                      child: Text("Save & Explore"),
                    ),
                )
            )
          ],
        ),
      ),
    );
  }
}





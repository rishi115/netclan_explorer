import 'package:flutter/material.dart';

class PurposeContainer extends StatefulWidget {
  final String purpose;
  final bool isSelected;
  final Function() onTap;

  const PurposeContainer({
    required this.purpose,
    required this.isSelected,
    required this.onTap,
  });

  @override
  _PurposeContainerState createState() => _PurposeContainerState();
}

class _PurposeContainerState extends State<PurposeContainer> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
          if (isTapped) {
            widget.onTap();
          }
        });
      },
      child: Container(
        width: 80,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(25),
          color: isTapped ? const Color(0xFF173148) : Colors.transparent,
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            widget.purpose,
            style: TextStyle(
              color: isTapped ? Colors.white : Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

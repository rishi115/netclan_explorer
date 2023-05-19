import 'package:flutter/material.dart';

class HorizontalTubeWidget extends StatelessWidget {
  final double fillPercentage;
  final Color fillColor;

  const HorizontalTubeWidget({
    Key? key,
    required this.fillPercentage,
    required this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 4,
      child: Container(
        width: 80,
        height: 12,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: fillPercentage / 100,
                child: Container(
                  color: fillColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '${fillPercentage.round()}km',
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

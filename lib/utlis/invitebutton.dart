import 'package:flutter/material.dart';

class AnimatedInviteText extends StatefulWidget {
  @override
  _AnimatedInviteTextState createState() => _AnimatedInviteTextState();
}

class _AnimatedInviteTextState extends State<AnimatedInviteText> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isInvited = false;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleInviteStatus() {
    setState(() {
      _isInvited = !_isInvited;
    });
    if (_isInvited) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: _toggleInviteStatus,
          child: AnimatedDefaultTextStyle(

            style: _isInvited
                ? TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)
                : TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Text(
              _isInvited ? 'Pending' : 'Invite',
            ),
          ),
        ),
      ),
    );
  }
}

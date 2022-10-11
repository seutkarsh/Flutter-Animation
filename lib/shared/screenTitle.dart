import 'package:flutter/material.dart';

class ScreenTitle extends StatefulWidget {
  final String text;
  const ScreenTitle({super.key, required this.text});

  @override
  State<ScreenTitle> createState() => _ScreenTitleState();
}

class _ScreenTitleState extends State<ScreenTitle>
    with SingleTickerProviderStateMixin {
  // Color textColor = Colors.pink;
  late AnimationController _controller;
  late Animation _textColor;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    _textColor =
        ColorTween(begin: Colors.pink, end: Colors.green).animate(_controller);
    _controller.forward();

    _controller.addListener(() {
      print(_textColor.value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      // onEnd: () {
      //   setState(() {
      //     textColor = Colors.white;
      //   });
      // },
      curve: Curves.bounceOut,
      duration: Duration(seconds: 1),
      tween: Tween<double>(begin: 5, end: 36),
      builder: (context, value, child) {
        return Text(
          widget.text,
          style: TextStyle(
              fontSize: value,
              color: _textColor.value,
              fontWeight: FontWeight.bold),
        );
      },
    );
  }
}

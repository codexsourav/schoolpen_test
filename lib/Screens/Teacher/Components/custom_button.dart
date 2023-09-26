import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final Widget text;
  final int width;
  final int height;
  final Color bg;

  const RoundedButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.bg,
  });

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * widget.width / 100,
        height: widget.height.toDouble(),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: widget.bg,
          ),
          child: widget.text,
        ),
      ),
    );
  }
}

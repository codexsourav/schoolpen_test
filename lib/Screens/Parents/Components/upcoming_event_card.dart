import 'package:flutter/material.dart';

class UpcomingEvent extends StatelessWidget {
  final List<String> imagePaths;

  UpcomingEvent({
    required this.imagePaths,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: imagePaths.map((path) {
            return Container(
              child: Image.asset(
                path,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

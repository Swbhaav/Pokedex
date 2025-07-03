import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  final Widget child;
  // final String image;
  const MyCards({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            ],
          ),
    );
  }
}

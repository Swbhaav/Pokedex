import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  final String name;
  const MyCards({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      child: SizedBox(
        height: 160,
        width: 160,
        child: Center(
          child: Padding(padding: EdgeInsets.all(15), child: Text(name)),
        ),
      ),
    );
  }
}

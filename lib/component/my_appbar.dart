import 'package:flutter/material.dart';
class MyAppbar extends StatelessWidget implements PreferredSizeWidget{

  final String title;
  final List<Widget> action;
  const MyAppbar({super.key, required this.title,  this.action = const []});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.grey,
      elevation: 0,
      actions: action,

    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';

class TitleAppbar extends StatelessWidget {
  const TitleAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return
      Text(
        title,  
        style: textStyle.titleLarge?.copyWith(fontSize: 26, fontWeight: FontWeight.w600)
      );
  }
}

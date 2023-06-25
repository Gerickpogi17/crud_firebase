

import 'package:flutter/material.dart';

class TitleTextMain extends StatelessWidget {
  final String mainText;
  final Color textColor;
  final double titleSize;
  final FontWeight titleWeight;
  const TitleTextMain({
  Key? key, 
  required this.mainText, 
  required this.textColor, 
  required this.titleSize,
  required this.titleWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      mainText,
      style: TextStyle(
      color: textColor,
      fontSize: titleSize,
      fontWeight: titleWeight
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:template_edit/textInfoModel.dart';

class ImageText extends StatelessWidget {
  final TextInfo textInfo;
  const ImageText({
    super.key,
    required this.textInfo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        textInfo.text,
        textAlign: textInfo.textAlign,
        style: TextStyle(
          color: textInfo.color,
          fontSize: textInfo.fontSize,
          fontWeight: textInfo.fontWeight,
          fontStyle: textInfo.fontStyle,
        ),
      ),
    );
  }
}
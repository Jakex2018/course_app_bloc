import 'package:flutter/material.dart';
class ImageAsset extends StatelessWidget {
  const ImageAsset({
    super.key, required this.image, required this.height,
  });
 final String image;
 final double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Image.asset('asset/icons/$image.png',height:height ,));
  }
}
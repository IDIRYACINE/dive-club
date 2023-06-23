
import 'dart:io';

import 'package:dive_club/resources/resources.dart';
import 'package:flutter/material.dart';

class FaultToleratedImage extends StatelessWidget{

  const FaultToleratedImage({Key? key, required this.imageUrl, this.width, this.height}) : super(key: key);

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.file
    (File(imageUrl),
    width: width,
    height: height,
    fit: BoxFit.fill,
    
    errorBuilder: (context,error,stack) => Image.asset(AppResources.noPreviewImage),);
  }

}
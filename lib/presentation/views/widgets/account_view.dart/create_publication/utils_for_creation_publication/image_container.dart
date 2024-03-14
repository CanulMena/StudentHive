import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContainerImages extends StatelessWidget {
  final double width;
  final double height;
  final XFile? image;

  const ContainerImages({
    super.key,
    required this.width,
    required this.height,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: image != null // This is the image that is shown in the container
          ? ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
                File(image!.path),
                fit: BoxFit.cover,
              ),
          )
          : const Center(child: Icon(Icons.image)),
    );
  }
}
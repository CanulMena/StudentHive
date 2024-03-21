import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studenthive/presentation/screens/widgets/auth_register_dialog.dart';

class ContainerImages extends StatelessWidget {
  final double width;
  final double height;
  final XFile? image;
  final VoidCallback deleteImage;

  const ContainerImages({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.deleteImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        // This is the container that contains the image and i want to add an gradient.
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
      ),

      Positioned(
      top: 1,
      right: 1.5,
      child: IconButton(
        onPressed: () {
          DialogUtils.openDialogImageAlert(context, deleteImage);
        },
        icon: Icon(
          Icons.close_rounded,
          color: Colors.grey[400],
          size: 20,
        ),
      ),
    ),

    ]);
  }
}

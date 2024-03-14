import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogUtils {

  static void openDialogImageAlert( BuildContext context, VoidCallback deleteImage ){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: const Text('Sure?', style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [

            TextButton(
              onPressed: () {
                context.pop();
              }, 
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),

            const SizedBox( width: 20,),

            TextButton(
              onPressed: () {
                // deleteImage is a function that deletes the image
                deleteImage();  
                context.pop();
              }, 
              child: const Text('Sure', style: TextStyle(color: Colors.blue)),
            ),

          ],
        );
      },
    );
  }

  static void openDialogAuth(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('You need to be registered', style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Are you sure you want to logout?',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Cancel', style: TextStyle(color: Colors.red)),
                ),
                TextButton(
                onPressed: () {
                  context.go('/login');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const Text('Register', style: TextStyle(color: Colors.white)),
                ),

              ],
            )
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/presentation/provider/auth_provider.dart';
import 'package:studenthive/presentation/provider/user_provider.dart';

class DialogUtils {
  static void openDialog(BuildContext context, AuthProvider authProvider, UserProvider userProvider) {
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

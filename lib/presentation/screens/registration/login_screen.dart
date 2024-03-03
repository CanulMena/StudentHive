import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/screens/widgets/registration/login/blue_box.dart';
import 'package:studenthive/presentation/screens/widgets/registration/login/loggin_form_container.dart';
import 'package:studenthive/presentation/screens/widgets/registration/login/hive_icon.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            BlueBox(boxHeigh: size.height * 0.75, circularRadius: 200),
            HiveIcon(size: size.height * 0.001, iconSize: 200),
            loginForm(context),
            // closeButton(context, userProvider),
          ],
        ),
      ),
    );
  } 

  Widget loginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250),
          Container( // 
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                LogginFormContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget closeButton(BuildContext context, UserProvider userProvider) {
    return Positioned(
      top: 50,
      left: 30,
      child: GestureDetector(
        onTap: () {
          // userProvider.loadCurrentUser();
          context.go('/home');
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}

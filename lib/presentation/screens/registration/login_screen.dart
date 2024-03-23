import 'package:flutter/material.dart';
import 'package:studenthive/presentation/screens/widgets/registration/login/blue_box.dart';
import 'package:studenthive/presentation/screens/widgets/registration/login/loggin_form_container.dart';
import 'package:studenthive/presentation/screens/widgets/registration/login/hive_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if (MediaQuery.of(context).viewInsets.bottom > 0) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        220,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              BlueBox(boxHeigh: size.height * 0.75, circularRadius: 200),
              HiveIcon(size: size.height * 0.001, iconSize: 200),
              loginForm(context)
              // closeButton(context, userProvider),
            ],
          ),
        ),
    );
  } 

  Widget loginForm(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
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
            child: const Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                LogginFormContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget closeButton(BuildContext context, UserProvider userProvider) {
  //   return Positioned(
  //     top: 50,
  //     left: 30,
  //     child: GestureDetector(
  //       onTap: () {
  //         // userProvider.loadCurrentUser();
  //         context.go('/home');
  //       },
  //       child: const Icon(Icons.close),
  //     ),
  //   );
  // }
}

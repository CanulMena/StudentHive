import 'package:flutter/material.dart';
import 'package:studenthive/presentation/screens/widgets/registration/create_acount/create_an_account.dart';
import 'package:studenthive/presentation/screens/widgets/registration/login/blue_box.dart';
import 'package:studenthive/presentation/screens/widgets/registration/login/hive_icon.dart';

class CreateAnAccountScreen extends StatelessWidget {
  const CreateAnAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            BlueBox(boxHeigh: size.height * 0.8, circularRadius: 100),
            HiveIcon(size: size.height * 0.01, iconSize: 100),
            const CreateAnAccountForm(),
          ],
        ),
      ),
    );
  }

  
}

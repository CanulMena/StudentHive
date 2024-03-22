import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RequestViewNoLogged extends StatelessWidget {
  const RequestViewNoLogged({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Column(
          children: [
            Text(
              'Solicitudes',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 55,
            ),
            Text(
              'You need to be logged',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'You can create an account to use RequestList and it is totally free',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _CustomButton()
          ],
        )
      ],
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {
            context.go('/login');
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              'Log in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

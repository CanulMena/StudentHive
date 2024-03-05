import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/domain/entities/rentalhouse.dart';
import 'package:studenthive/presentation/provider/auth/auth_token_provider.dart';
import 'package:studenthive/presentation/provider/reserve_provider.dart';
import 'package:studenthive/presentation/provider/user/user_provider.dart';
import 'package:studenthive/presentation/screens/widgets/auth_register_dialog.dart';

class BottomPublication extends StatelessWidget {
  // final RentalHouse publicationPost;
  const BottomPublication({super.key, /* required this.publicationPost */});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    // final reserveProvider = context.watch<ReserveProvider>();
    final userProvider = context.watch<UserProvider>();
    // final authProvider = context.watch<AuthProvider>();
    return Container(
      height: size.height * 0.10,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 229, 218, 218)
          ),
        )
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
    
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   '\$${publicationPost.rentPrice} MXN',
                //   style: const TextStyle(
                //     fontSize: 15,
                //     color: Colors.black,
                //   ),
                // ),
                const Text(
                  'AL MES',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
    
            ElevatedButton(
              onPressed: () {
                // if(authProvider.isLogged){
                // context.push('/reserve',);
                // reserveProvider.addReservation(publicationPost);
                // } else {
                //   DialogUtils.openDialog(context, authProvider, userProvider);
                // }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: const Text(
                'Reservar',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
    
          ],
        ),
    );
  }
}

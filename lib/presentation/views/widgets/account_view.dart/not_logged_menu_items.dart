import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/config/menu/menu_item.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/custom_list_tile.dart';

class NoLoggedMenuItems extends StatelessWidget {
  const NoLoggedMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    return ListView(
          children: [
            
            const SizedBox(height: 50,),
            
            Text(
            'Profile',
            style: textStyle.bodyLarge?.copyWith(fontSize: 32, fontWeight: FontWeight.w600)
            ),

            const SizedBox(height: 15,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  'Log in to add yours reservations',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54
                    ),
                  ),

                const SizedBox(height: 35,),

                ClipRRect(//por que este ClipRRect ocupa todo el widgh de la pantalla que tiene
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Material(
                    color: colors.primary,
                    child: InkWell(
                      onTap: () => context.go('/login'),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 17),
                        child: Center(
                          child: Text(
                            'Loggin',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                              ),
                            )
                          ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15,),

                Row(
                  children: [

                    const Text(
                      'Dont have an account?',
                      style: TextStyle(
                        fontSize: 12
                        ),
                      ),

                    TextButton(
                      onPressed: () {
                        context.go('/createAccount');
                        },
                      child: const Text(
                        'Sing Up',
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.underline
                          ),
                        ),
                    ),

                  ],
                ),
                
                const SizedBox(height: 15,),

              ],
            ),
          
            ...noLoggedMenuItems.map((menuItem) => CustomListTile(menuItem: menuItem)),
          
          ],
        );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/logged_menu_items.dart'; //* Tengo que refactorizar esto tarde o temprano
import 'package:studenthive/presentation/views/widgets/account_view.dart/not_logged_menu_items.dart';

class AcountView extends ConsumerWidget {
  const AcountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isTokenAuth = ref.watch(isTokenAuthProvider);
    final desavowToken = ref.read(isTokenAuthProvider.notifier).desavowToken;
    final removeUser = ref.read(userProvider.notifier).removeUser;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: isTokenAuth 
      ? LoggedAppMenuItems(desavowToken: desavowToken, removeUser: removeUser,) 
      : const NoLoggedMenuItems(),
    );
  }
}


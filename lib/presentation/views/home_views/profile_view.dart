import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/user.dart';
import 'package:studenthive/presentation/provider/user/user_provider.dart';
import 'package:studenthive/presentation/views/widgets/profile_view/profile_view_complet.dart';
import 'package:studenthive/presentation/views/widgets/profile_view/profile_view_no_complet.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userProvider);
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          //! Aquí se cambia por el
          ),
      body: isUserDataComplete(user!)
          ? const ProfileViewNoComplete()
          : const ProfileViewComplete(),
      // ProfileViewNoComplete(),
      // ProfileViewReady(),,
    );
  }

  bool isUserDataComplete(User user) {
    return user.userAge == null &&
        user.description == null &&
        user.gender == null &&
        user.lastName == null &&
        user.phoneNumber == null &&
        user.profilePhotoUrl == null;
  }
}

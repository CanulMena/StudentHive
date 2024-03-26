import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:studenthive/presentation/provider/user/user_provider.dart';
import 'package:studenthive/presentation/views/widgets/account_view.dart/create_publication/routerAnimation/router_animation.dart';
import 'package:studenthive/presentation/views/widgets/profile_view/create_profile_view.dart';

class ProfileViewNoComplete extends ConsumerStatefulWidget {
  const ProfileViewNoComplete({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileViewNoComplete> createState() => _ProfileViewNoCompleteState();
}

class _ProfileViewNoCompleteState extends ConsumerState<ProfileViewNoComplete> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var user = ref.watch(userProvider);
    return ListView(
          children: [
            Column(children: [
              Container(
                // color: Colors.white,
                width: size.width * 0.9,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 2,
                    )),
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(20)),
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1511367461989-f85a21fda167?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    ),
                    SizedBox(
                      height: size.height * 0.3 * 0.05,
                    ),
                    Text(
                      '${user?.name}${user?.lastName != null ? user!.lastName! : ""}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user?.email ?? '',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              const ButtonCreateProfile()
            ])
          ],
        );
  }
}

class ButtonCreateProfile extends StatelessWidget {
  const ButtonCreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.2,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 2,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'Crea un perfil para que los demas usuarios puedan conocerte mejor y puedan contactarte mas facilmente.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.5 * 0.3,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(createPageRoute(const CreateProfileView()));
          },
          child: const Text(
            'Crear Perfil',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

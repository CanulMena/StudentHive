import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:studenthive/presentation/provider/user/user_provider.dart';

class ProfileViewComplete extends ConsumerStatefulWidget {
  const ProfileViewComplete({super.key});

  @override
  ConsumerState<ProfileViewComplete> createState() => _ProfileViewReadyState();
}

class _ProfileViewReadyState extends ConsumerState<ProfileViewComplete> {
  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    var user = ref.watch(userProvider);
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(user?.profilePhotoUrl ?? ''),
              ),
              InputContainerInformation(
                icon: (Icons.person),
                title: 'Nombre',
                value: user?.name ?? '',
                textStyle: textStyles.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.black54),
              ),
              _HorizontalLine(),
              InputContainerInformation(
                icon: (Icons.person),
                title: 'Apellido',
                value: user?.lastName ?? '',
                textStyle: textStyles.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.black54),
              ),
              _HorizontalLine(),
              InputContainerInformation(
                icon: (Icons.email),
                title: 'Correo',
                value: user?.email ?? '',
                textStyle: textStyles.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.black54),
              ),
              _HorizontalLine(),
              InputContainerInformation(
                icon: (Icons.phone),
                title: 'Telefono',
                value: '${user?.phoneNumber ?? ''}',
                textStyle: textStyles.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.black54),
              ),
              _HorizontalLine(),
              InputContainerInformation(
                icon: (Icons.cake),
                title: 'Edad',
                value: '${user?.userAge ?? ''}',
                textStyle: textStyles.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.black54),
              ),
              _HorizontalLine(),
              InputContainerInformation(
                icon: (Icons.location_on),
                title: 'Genero',
                value: getGender(user?.gender),
                textStyle: textStyles.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.black54),
              ),
              _HorizontalLine(),
              InputContainerInformation(
                icon: (Icons.description),
                title: 'Informacion',
                value: user?.description ?? '',
                textStyle: textStyles.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.black54),
              ),
            ],
          ),
        )
      ],
    );
  }

  //? Funcion para obtener el genero
  String getGender(int? gender) {
    if (gender == 1) {
      return 'Masculino';
    } else if (gender == 2) {
      return 'Femenino';
    } else {
      return 'Otro';
    }
  }
}

class InputContainerInformation extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final TextStyle textStyle;
  const InputContainerInformation(
      {super.key,
      required this.title,
      required this.value,
      required this.icon,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return Container(
      // height: size.height * 0.12,
      width: size.width * 0.95,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   border: Border.all(
      //     color: Colors.grey.withOpacity(0.5),
      //     width: 2,
      //   ),
      // ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.grey,
          ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.95 * 0.75,
                        child: Text(value,
                            style: textStyle.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                                fontSize: 17)),
                      )
                    ],
                  ),
                ],
              )
              ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class _HorizontalLine extends StatelessWidget {
  final double height = .75;
  final Color color = const Color.fromARGB(255, 201, 197, 197);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color,
    );
  }
}

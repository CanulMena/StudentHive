import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:studenthive/presentation/provider/user/user_provider.dart';

class ProfileViewReady extends ConsumerStatefulWidget {
  const ProfileViewReady({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileViewReady> createState() => _ProfileViewReadyState();
}

class _ProfileViewReadyState extends ConsumerState<ProfileViewReady> {
  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userProvider);
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputContainerInformation(
                    icon: (Icons.person),
                    title: 'Nombre',
                    value: user?.name ?? '',
                  ),
                  const SizedBox(width: 100),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user?.profilePhotoUrl ?? ''),
                  )
                ],
              ),
              _HorizontalLine(),
              InputContainerInformation(
                icon: (Icons.person),
                title: 'Apellido',
                value: user?.lastName ?? '',
              ),
              _HorizontalLine(),
              InputContainerInformation(
                icon: (Icons.email),
                title: 'Correo',
                value: user?.email ?? '',
              ),
              _HorizontalLine(),
              InputContainerInformation(
                icon: (Icons.phone),
                title: 'Telefono',
                value: '${user?.phoneNumber ?? ''}',
              ),
              _HorizontalLine(),
              InputContainerInformation(
                icon: (Icons.cake),
                title: 'Edad',
                value: '${user?.userAge ?? ''}',
              ),
              _HorizontalLine(),
              InputContainerInformation(
                  icon: (Icons.location_on),
                  title: 'Genero',
                  value: getGender(user?.gender)),
              _HorizontalLine(),
              SizedBox(
                height: 500,
                child: InputContainerInformation(
                  icon: (Icons.description),
                  title: 'Informacion',
                  value: user?.description ?? '',
                ),
              )
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
  const InputContainerInformation(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Container(
      // height: size.height * 0.1,
      // width: size.width * 0.9,
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
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
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
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/house.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/provider/request/request_provider.dart';

class BottomPublication extends ConsumerWidget {
  final House houseDetail;
  const BottomPublication({super.key, required this.houseDetail});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider)!.idUser;
    final postRequest = ref.watch(requestProvider.notifier).postRequest;
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.10,
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(color: Color.fromARGB(255, 229, 218, 218)),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$${houseDetail.rentPrice} MXN',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
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
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: const Text('Confirmar solicitud'),
                        content: const Text(
                            '¿Estás seguro que quieres solicitar la publicación?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancelar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Confirmar'),
                            onPressed: () {
                              postRequest(user, houseDetail.idPublication);
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Reserva Hecha con exito!')));
                            },
                          ),
                        ]);
                  });
              // postRequest(user, houseDetail.idPublication);
              // if(authProvider.isLogged){ //TODO: Terminar la validacion
              // //TODO implementar el baner de cofirmacion para la solicitud
              // // context.push('/reserve',);
              // // reserveProvider.addReservation(publicationPost);
              // // } else {
              // //   DialogUtils.openDialog(context, authProvider, userProvider);
              // // }
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

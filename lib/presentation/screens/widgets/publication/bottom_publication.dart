import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/house.dart';
import 'package:studenthive/presentation/provider/providers.dart';

class BottomPublication extends ConsumerWidget {
  final House houseDetail;
  const BottomPublication({super.key, required this.houseDetail});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.read(userProvider)!.idUser;
    final myPostRequest = ref.watch(myRequestProvider.notifier).myPostRequest;

    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigation = Navigator.of(context);
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
                            onPressed: () async {
                              try {
                              final success = await myPostRequest(userId, houseDetail.idPublication);
                                if (success) {
                                  scaffoldMessenger.showSnackBar(
                                    const SnackBar(content: Text('Reserva Hecha con exito!'))
                                  );
                                  navigation.pop();
                                } else {
                                  scaffoldMessenger.showSnackBar(
                                    const SnackBar(content: Text('Ya has hecho una reserva'))
                                  );
                                  navigation.pop();
                                }
                              } catch (e) {
                                scaffoldMessenger.showSnackBar(
                                    const SnackBar(content: Text('La reserva no sepudo hacer'))
                                  );
                                  navigation.pop();
                              }
                              
                            },
                          ),
                        ]);
                  });
              // if(authProvider.isLogged){
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

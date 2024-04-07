import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/presentation/provider/providers.dart';

class RequestViewHost extends ConsumerWidget {
  const RequestViewHost({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    final user = ref.watch(userProvider);
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                //TODO: Logica para ver el perfil del usuario que envio la solicitud
              },
              child: Container(
                width: size.width * 0.95,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(user?.profilePhotoUrl ?? ''),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${user?.name} ${user?.lastName ?? ''} a mandado una solicitud para ser tu inquilino',
                              style: textStyle.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    //TODO Logica para aceptar solicitud
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.green),
                                  ),
                                  child: const    Text('Aceptar'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    //TODO Logica para rechazar una solicitud
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.red),
                                  ),
                                  child: const Text('Rechazar'),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
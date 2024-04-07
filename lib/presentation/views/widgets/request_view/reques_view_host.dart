import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/providers.dart';

class RequestViewHost extends ConsumerStatefulWidget {
  
  const RequestViewHost({super.key});

  @override
  ConsumerState<RequestViewHost> createState() => _RequestViewHostState();
}

class _RequestViewHostState extends ConsumerState<RequestViewHost> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    final user = ref.watch(userProvider);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.95,
              height: size.height * 0.15,
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
                                child: Text('Aceptar'),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.green),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  //TODO Logica para rechazar una solicitud
                                },
                                child: const Text('Rechazar'),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.red),
                                ),
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
          ],
        ),
      ),
    );
  }
}
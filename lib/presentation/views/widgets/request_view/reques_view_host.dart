import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/provider/providers.dart';

class RequestViewHost extends ConsumerWidget {
  final List<MyRequest> myRequests;
  final Future<void> Function(int) removeMyRequest;
  final Future<void> Function(int, String, int) evaluateRequest;
  const RequestViewHost({
    super.key, 
    required this.myRequests,
    required this.removeMyRequest,
    required this.evaluateRequest
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    final myIdUser = ref.watch(userProvider)!.idUser; 
    final getUserById = ref.watch(getUserByIdProvider);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    return ListView.builder(
      itemCount: myRequests.length,
      itemBuilder: (context, index) {
        final MyRequest request = myRequests[index];
        return FutureBuilder<User>(
          future: getUserById(request.idUser),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();  // Show a loading spinner while waiting
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');  // Show error if something goes wrong
            } else {
              final User user = snapshot.data!;
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
                              backgroundImage: NetworkImage(user.profilePhotoUrl ?? 'https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png'),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Flexible(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${user.name} ${user.lastName} a mandado una solicitud para ser tu inquilino',
                                      style: textStyle.bodyLarge!.copyWith(
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
                                          onPressed: () async {
                                            try{
                                              await evaluateRequest(request.idRequest, 'Aceptada', myIdUser);
                                              //TODO: Logica para enviar una notificación al usuario que envio la solicitud
                                              scaffoldMessenger.showSnackBar(
                                                const SnackBar(
                                                  content: Text('Solicitud aceptada con éxito'),
                                                  duration: Duration(seconds: 2),
                                                ),
                                              );
                                            } catch (e) {
                                              //Manejar el error aquí
                                            }
                                          },
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.green),
                                          ),
                                          child: const Text('Aceptar'),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            try{
                                              await removeMyRequest(request.idRequest);
                                            } catch (e) {
                                              //Manejar el error aquí
                                            }

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
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
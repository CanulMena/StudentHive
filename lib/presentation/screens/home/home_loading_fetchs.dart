import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({super.key});

  Stream stream() {
    List<String> messages = [
      'Las casas están cargando...',
      'Por favor, espera un momento...',
      'Cargando datos...',
      'Estamos buscando las mejores casas para ti...',
      'Cargando información...',
      'Se esta tardando mas de lo esperado :('
    ];
    // La informacion que se regresará del step es el snapshot.data - es el return messages[step]
    return Stream.periodic(const Duration(milliseconds: 2000), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/loading.json',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              animate: true,
              repeat: true,
              reverse: true,
              key: const Key('loading_animation'),
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder(
              stream: stream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('cargando...');
                return Text(snapshot.data!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
              },
            )
          ],
        ),
      ),
    );
  }
}

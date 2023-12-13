import 'package:flutter/material.dart';
import 'package:studenthive/presentation/screens/widgets/reserve/reserve_container.dart';

class ManageRequest extends StatelessWidget {
  const ManageRequest({super.key});

  @override
  Widget build(BuildContext  context) {
    const TextStyle boldTextStyle =  TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold
    );

    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: theme.primary,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Solicitudes Enviadas',
            style: boldTextStyle,
          ),
        ),

        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return const Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                     vertical: 10,
                     ),

                  child: ReserveContainer(),
                ),
              ],
            );
          },
        )
      );
  }
}
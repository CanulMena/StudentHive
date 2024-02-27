import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/presentation/provider/reserve_provider.dart';
import 'package:studenthive/presentation/screens/widgets/reserve/reserve_container.dart';

class ReserveScreen extends StatelessWidget {
  const ReserveScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final reserveProvider = context.watch<ReserveProvider>();

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
            color: Colors.white,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text(
          'Solicitudes Enviadas',
          style: boldTextStyle,
          ),
        ),
        
        body: ListView.builder(
          itemCount: reserveProvider.listReservation.length,
          itemBuilder: (context, index) {
            final publicationReserved = reserveProvider.listReservation[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    ),

                  child: ReserveContainer(
                    publicationReserved: publicationReserved,
                    reserveProvider: reserveProvider,
                    ),
                ),
              ],
            );
          },
        )
      );
  }
}

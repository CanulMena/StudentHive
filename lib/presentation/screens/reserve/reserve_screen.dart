import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthive/presentation/provider/reserve_provider.dart';
import 'package:studenthive/presentation/screens/widgets/reserve/reserve_container.dart';

class ReserveScreen extends StatelessWidget {
  const ReserveScreen({super.key,});

  @override
  Widget build(BuildContext  context) {
    final reserveProvider = context.watch<ReserveProvider>();

    const TextStyle boldTextStyle =  TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold
    );

    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: _CustomAppBar(
        theme: theme, 
        boldTextStyle: 
        boldTextStyle).build(context),

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

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    required this.theme,
    required this.boldTextStyle,
  });

  final ColorScheme theme;
  final TextStyle boldTextStyle;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
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
        title: Text(
          'Solicitudes Enviadas',
          style: boldTextStyle,
        ),
      );
  }
}
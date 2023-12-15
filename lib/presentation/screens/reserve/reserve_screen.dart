import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/screens/widgets/reserve/reserve_container.dart';

class ReserveScreen extends StatelessWidget {
  final Publication publicationPost;
  const ReserveScreen({super.key, required this.publicationPost});

  @override
  Widget build(BuildContext  context) {

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
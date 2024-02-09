import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/screens/widgets/widgets_screens/publication/custom_sliverappbar_p.ublication.dart';

class CustomListView extends StatelessWidget {
  final Publication publicationPost;

  const CustomListView({super.key, required this.publicationPost});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(publicationPost: publicationPost),
        SliverList(
            delegate:
                SliverChildBuilderDelegate(childCount: 1, (context, index) {
          return _RentalHouseDetils(
            publicationPost: publicationPost,
          );
        }))
      ],
    );
  }
}



class _RentalHouseDetils extends StatelessWidget {
  final Publication publicationPost;
  const _RentalHouseDetils({required this.publicationPost});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                publicationPost.titulo,
                style:
                    textStyle.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                publicationPost.ubicacionHabitacion,
                style:
                    textStyle.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 3,
              ),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/screens/widgets/widgets_screens/publication/bottom_publication.dart';

class PublicationScreen extends StatelessWidget {
  final Publication publicationPost;
  const PublicationScreen({
    super.key,
    required this.publicationPost,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: _CustomListView(
          publicationPost: publicationPost,
        )),
        BottomPublication(publicationPost: publicationPost)
      ],
    ));
  }
}

class _CustomListView extends StatelessWidget {
  final Publication publicationPost;

  const _CustomListView({required this.publicationPost});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _CustomSliverAppBar(publicationPost: publicationPost),
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

class _CustomSliverAppBar extends StatelessWidget {
  final Publication publicationPost;
  const _CustomSliverAppBar({required this.publicationPost});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      floating: true,
      expandedHeight: size.height * 0.5,
      // foregroundColor: Colors.white,
      backgroundColor: Colors.black54,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(publicationPost.imagenes[1],
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if( loadingProgress != null) return const SizedBox();
                return FadeIn(child: child);
              },
              ),
            )
          ],
        ),
      )
    );
  }
}

class _RentalHouseDetils extends StatelessWidget {
  final Publication publicationPost;
  const _RentalHouseDetils({required this.publicationPost});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: size.height * 0.5,
        //   width: size.width * 1,
        //   child: Image.network(
        //     publicationPost.imagenes[1],
        //     fit: BoxFit.cover,
        //   ),
        // ),
        Container(
          //Information container
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
              // Text(
              //   publicationPost.ubicacionHabitacion,
              //   style: textStyle.bodyLarge?.copyWith(
              //     fontWeight: FontWeight.w500
              // ),),
            ],
          ),
        )
      ],
    );
  }
}







// Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back_ios),
//                     onPressed: () => context.go('/home'),
//                   ),
//                   const Spacer(),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 4.0),
//                     child: Icon(Icons.favorite_border_outlined),
//                   ),
//                 ],
//               ),
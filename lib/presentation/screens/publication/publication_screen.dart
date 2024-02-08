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
    body:  Column(
      children: [
        Expanded(child: _CustomListView(publicationPost: publicationPost,)),
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
      const SliverAppBar(
        // pinned: true,
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.all(0),
          title: _CustomAppBarP(),   
        ),
        
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: 1,
          (context, index) {
            return _RentalHouseDetils(publicationPost: publicationPost,); 
          }
        )
      )
    ],
  );

  }
}


class _CustomAppBarP extends StatelessWidget {
  const _CustomAppBarP();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => context.go('/home'),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Icon(Icons.favorite_border_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RentalHouseDetils extends StatelessWidget {
  final Publication publicationPost; 
  const _RentalHouseDetils({ required this.publicationPost});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          height: size.height * 0.5,
          width: size.width * 1,
          child: Image.network(
            publicationPost.imagenes[1],
            fit: BoxFit.cover,
            ), 
        ),

        Container(//Information container
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              publicationPost.titulo,
              style: textStyle.titleLarge?.copyWith(
                fontWeight: FontWeight.w600
              ),),
            const SizedBox(height: 6,),
            Text(
              publicationPost.ubicacionHabitacion,
              style: textStyle.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600
              ),),
            const SizedBox(height: 3,),
            // Text(
            //   publicationPost.ubicacionHabitacion,
            //   style: textStyle.bodyLarge?.copyWith(
            //     fontWeight: FontWeight.w500
            // ),),

          ],
        ),)
      ],
    );
  }
}
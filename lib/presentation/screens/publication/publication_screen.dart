import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthive/domain/entities/publication.dart';
import 'package:studenthive/presentation/screens/widgets/widgets_screens/publication/bottom_publication.dart';

class PublicationScreen extends StatelessWidget {
  final Publication publicationPost; //!Una forma de obtener el valor de esta variable desde el go_router
  const PublicationScreen({
    super.key, 
    required this.publicationPost,
    });

    @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  _CustomListView(publicationPost: publicationPost,));

    }
}

class _CustomListView extends StatelessWidget {
  final Publication publicationPost;

  const _CustomListView({required this.publicationPost});

  @override
  Widget build(BuildContext context) {
    
    // const TextStyle boldTextStyle = TextStyle(
    //   fontSize: 20,
    //   fontWeight: FontWeight.bold,
    //   );

    // const TextStyle secondText = TextStyle(
    //   fontSize: 15,
    //   fontWeight: FontWeight.w500,
    // );

  return const CustomScrollView(
    slivers: [
      SliverAppBar(
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.all(0),
          title: _CustomAppBarP(),
          
        ),
      ),

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
import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/rentalhouse.dart';
import 'package:studenthive/presentation/delegates/search_publication_delegate.dart';
import 'package:studenthive/presentation/screens/widgets/home/publications/publication_container.dart';

class PublicationsView extends StatelessWidget {
  final List<RentalHouse> listPublications;
  const PublicationsView({
    super.key,
    required this.listPublications,
  });

  @override
  Widget build(BuildContext context) {
    // final homeProvider = context.watch<HomeProvider>();
    // final createPublicationProvider = context.watch<CreatePublicationProvider>();
    return  CustomScrollView(
            //This is similar to an ListView within others ListView
            slivers: [
              const SliverAppBar(
                pinned: true, //this is to show persistence the color of the appbar
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.all(0),
                  title: CustomAppbar(),
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: listPublications.length, (context, index) {
                final publicationsPost = listPublications[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: PublicationContainer(
                          publicationsPost: publicationsPost),
                    ),
                  ],
                );
              })),
            ],
          );
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              Icons.hive_outlined,
              color: Colors.yellow.shade900,
              size: 28,
              ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'StudentHive',
              style: titleStyle?.copyWith(
                  color: Colors.amber.shade800,
                  fontSize: 20, // Tamaño del texto
                  fontWeight: FontWeight.w500  // Grosor del texto

              ),
            ),

            const Spacer(),
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context, 
                    delegate: SearchPublicationDelegate()
                    );
                },
                icon: const Icon(Icons.search_rounded,))
          ],
        ),
      ),
    ));
  }
}

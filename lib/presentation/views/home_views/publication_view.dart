import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/delegates/search_publication_delegate.dart';
import 'package:studenthive/presentation/provider/providers.dart';
import 'package:studenthive/presentation/screens/widgets/home/publications/publication_container.dart';

class PublicationsView extends ConsumerStatefulWidget {
  final List<HousePreview> listHousePreview;
  final VoidCallback? loadNextPage; 
  const PublicationsView({
    super.key,
    required this.listHousePreview, 
    required this.loadNextPage,
  });

  @override
  ConsumerState<PublicationsView> createState() => _PublicationsViewState();
}

class _PublicationsViewState extends ConsumerState<PublicationsView> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() { 
      if (widget.loadNextPage == null) return;
      if(scrollController.position.pixels + 200 >= scrollController.position.maxScrollExtent){
        widget.loadNextPage!();//si cumple la condicion, ejecutamos la función que le agregaremos al parametro
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

  final addFavoritesHouses = ref.watch(favoritesHousesProvider.notifier).addFavorites;
  final removeFavoritesHouses = ref.watch(favoritesHousesProvider.notifier).removeFavorite;
  final isFavoriteHouse = ref.watch(favoritesHousesProvider.notifier).isFavorite;

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 300));
    await ref.read(allHousesPreviewProvider.notifier).loadNextPage();
  }

  return RefreshIndicator(
    onRefresh: onRefresh,
    child: CustomScrollView(
            controller: scrollController,
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
                      childCount: widget.listHousePreview.length, (context, index) {
                final housePreview = widget.listHousePreview[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: PublicationContainer(
                        isFavoriteHouse: isFavoriteHouse,
                        addFavoritesHouses: addFavoritesHouses,
                        removeFavoritesHouses: removeFavoritesHouses,
                        housePreview: housePreview,
                        isTokenAut: true,
                        ),
                    ),
                  ],
                );
              })),
            ],
          ),
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

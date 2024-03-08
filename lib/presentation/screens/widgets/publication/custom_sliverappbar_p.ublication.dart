import 'package:flutter/material.dart';
class CustomSliverAppBar extends StatefulWidget {
  final List<String> images;
  const CustomSliverAppBar({super.key, required this.images,});

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  int actualPage = 1;

  final PageController scrollerPage = PageController();

  @override
  void initState() {
    scrollerPage.addListener(() {
      setState(() {
      actualPage = scrollerPage.page!.toInt() + 1;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollerPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      floating: true,
      expandedHeight: size.height * 0.5,
      foregroundColor: Colors.white,
      backgroundColor: Colors.black54,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            SizedBox.expand(
              child: PageView.builder(
                controller: scrollerPage,
                scrollDirection: Axis.horizontal,
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  final imagePost = widget.images[index];
                  return Image.network(
                  imagePost,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if( loadingProgress != null) return const SizedBox();
                    return child;
                    },
                  );
                },
              )
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade700.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(4)
                ),
                height: size.height * 0.5 * 0.075,
                width: size.width * 1 * 0.16,
                child: Center(child:
                Text(
                  '$actualPage/${widget.images.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ))
              )
            )
          ],
        ),
      )
    );
  }
}
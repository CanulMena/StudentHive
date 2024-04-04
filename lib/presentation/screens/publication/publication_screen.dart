import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/house/house_detail_provider.dart';
import 'package:studenthive/presentation/screens/widgets/publication/bottom_publication.dart';
import 'package:studenthive/presentation/screens/widgets/publication/customlistview_publication.dart';

class PublicationScreen extends ConsumerStatefulWidget {
  final String houseId;
  const PublicationScreen({
    super.key,
    required this.houseId,
  });

  @override
  ConsumerState<PublicationScreen> createState() => _PublicationScreenState();
}

class _PublicationScreenState extends ConsumerState<PublicationScreen> {

  @override
  void initState() {
    ref.read(houseDetailsProvider.notifier).loadHouseDetail( widget.houseId );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final houseMapDetails = ref.watch(houseDetailsProvider);

    final houseDetail = houseMapDetails[widget.houseId];

    if (houseDetail == null) {
      return const Scaffold(
        body: SizedBox()
      );
    }

    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: CustomListView(
          houseDetail: houseDetail,
        )),
        BottomPublication(houseDetail: houseDetail,)
      ],
    ));
  }
}


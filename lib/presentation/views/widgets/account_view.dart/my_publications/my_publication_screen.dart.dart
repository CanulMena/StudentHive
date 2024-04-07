import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/house/house_detail_provider.dart';
import 'package:studenthive/presentation/screens/widgets/publication/customlistview_publication.dart';

class MyPublicationScreen extends ConsumerStatefulWidget {
  final String houseId;
  const MyPublicationScreen({
    super.key,
    required this.houseId,
  });

  @override
  ConsumerState<MyPublicationScreen> createState() => _MyPublicationScreenState();
}

class _MyPublicationScreenState extends ConsumerState<MyPublicationScreen> {

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
      ],
    ));
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/providers.dart';
// import 'package:studenthive/presentation/provider/house/favorite_house_provider.dart';
import 'package:studenthive/presentation/views/widgets/request_view/request_logged_view.dart';
import 'package:studenthive/presentation/views/widgets/request_view/request_no_logged_view.dart';

class RequestView extends ConsumerStatefulWidget {
  final bool isTokenAut;

  const RequestView({super.key, required this.isTokenAut});

  @override
  ConsumerState<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends ConsumerState<RequestView> {
  @override
  void initState() {
    ref
        .read(requestProvider.notifier)
        .getAllMyRequests(ref.read(userProvider)!.idUser);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myRequests = ref.watch(requestProvider);
    final removeRequest = ref.read(requestProvider.notifier).deleteRequest;
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: RefreshIndicator(
        strokeWidth: 2,
        onRefresh: () {
          return Future(() => {});
        },
        child: Padding(
            padding: widget.isTokenAut
                ? const EdgeInsets.symmetric(horizontal: 0)
                : const EdgeInsets.symmetric(horizontal: 15),
            child: !widget.isTokenAut
                ? const RequestViewNoLogged()
                : RequestViewLogged(
                    myRequests: myRequests,
                    removeRequest: removeRequest,
                  )),
      ),
    );
  }
}

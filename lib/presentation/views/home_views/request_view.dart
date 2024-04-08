import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/providers.dart';
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
    final userId = ref.read(userProvider)!.idUser;
    ref
        .read(myRequestProvider.notifier)
        .getAllMyRequests(userId);
    ref
        .read(yourRequestProvider.notifier)
        .getAllYourRequests(userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myRequests = ref.watch(myRequestProvider);
    final yourRequests = ref.watch(yourRequestProvider);
    final removeRequest = ref.read(myRequestProvider.notifier).deleteRequest;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: const Text(''),
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
                ? const RequestViewNoLogged() // ---> Este se muestra si no esta logeado
                : RequestViewLogged( //* ---> Este se muestra si esta logeado
                    myRequests: myRequests,
                    removeRequest: removeRequest,
                    yourRequests: yourRequests,
                  )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/provider/user/user_detail_provider.dart';
import 'package:studenthive/presentation/screens/widgets/publication/custom_sliverappbar_p.ublication.dart';
import 'package:studenthive/presentation/screens/widgets/publication/user_information_publication_container.dart';

class CustomListView extends ConsumerStatefulWidget {
  final House houseDetail;

  const CustomListView({super.key, required this.houseDetail});

  @override
  ConsumerState<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends ConsumerState<CustomListView> {

  @override
  void initState() {
    String idUser = widget.houseDetail.idUser.toString();
    ref.read(userDetailProvider.notifier).loadUserDetail(idUser);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> userMapDetails = ref.watch(userDetailProvider);
    final userDetail = userMapDetails[widget.houseDetail.idUser.toString()];
      if (userDetail == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar( images: widget.houseDetail.images, ),
        SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 1, (context, index) {
            return _RentalHouseDetils(
              houseDetail: widget.houseDetail,
              userDetail: userDetail,
            );
          }))
        ],
      );
    }
  }
}

class _RentalHouseDetils extends StatelessWidget {
  final House houseDetail;
  final User userDetail; // el problema es que no tengo el userDetail de manera instantanea y me tira error. Pues user detail para como null hasta que se carga
  const _RentalHouseDetils({required this.houseDetail, required this.userDetail});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final String numberOfGuests =
        (houseDetail.rentalHouseDetail.numberOfGuests > 1)
            ? '${houseDetail.rentalHouseDetail.numberOfGuests} invitados'
            : '1 invitado';
    final String numberOfBathrooms =
        (houseDetail.rentalHouseDetail.numberOfBathrooms > 1)
            ? '${houseDetail.rentalHouseDetail.numberOfBathrooms} baños'
            : '1 baño';
    final String numberOfRooms =
        (houseDetail.rentalHouseDetail.numberOfRooms > 1)
            ? '${houseDetail.rentalHouseDetail.numberOfRooms} cuartos'
            : '1 cuarto';
    final String numberOfHammocks =
        (houseDetail.rentalHouseDetail.numberOfHammocks > 1)
            ? '${houseDetail.rentalHouseDetail.numberOfHammocks} hamacas'
            : '1 hamaca';
    final String numbersOfBed = (houseDetail.rentalHouseDetail.numbersOfBed > 1)
        ? '${houseDetail.rentalHouseDetail.numbersOfBed} camas'
        : '1 cama';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                //title
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                child: Text(
                  houseDetail.title,
                  style: textStyle.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
              Text(
                //hubication
                '${houseDetail.location.city} ${houseDetail.location.state} - ${houseDetail.location.neighborhood} - CP:${houseDetail.location.postalCode}',
                style: textStyle.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                //house details
                '$numberOfGuests . $numberOfBathrooms . $numberOfRooms . $numberOfHammocks . $numbersOfBed',
                style: textStyle.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.black54),
              ),
              const SizedBox(
                height: 20,
              ),
              _HorizontalLine(),
              const SizedBox(
                height: 20,
              ),
              //apartado de desscripscion de la casa
              const Text(
                'Acerca de este lugar',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                houseDetail.description,
                style: textStyle.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                    fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              _HorizontalLine(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Servicios',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
              if (!houseDetail.houseService.wifi &&
                  !houseDetail.houseService.kitchen &&
                  !houseDetail.houseService.washer &&
                  !houseDetail.houseService.water &&
                  !houseDetail.houseService.airConditioning &&
                  !houseDetail.houseService.television &&
                  !houseDetail.houseService.gas)
                Text(
                  'Esta casa no tiene servicios',
                  style: textStyle.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              houseDetail.houseService.wifi
                  ? const _CustomServices(icon: Icons.wifi, serviceName: 'Wifi')
                  : const SizedBox(),
              houseDetail.houseService.kitchen
                  ? const _CustomServices(
                      serviceName: 'Refrigerador', icon: Icons.kitchen_rounded)
                  : const SizedBox(),
              houseDetail.houseService.washer
                  ? const _CustomServices(
                      serviceName: 'Lavadora', icon: Icons.wash_rounded)
                  : const SizedBox(),
              houseDetail.houseService.water
                  ? const _CustomServices(
                      serviceName: 'Agua', icon: Icons.water_drop_rounded)
                  : const SizedBox(),
              houseDetail.houseService.airConditioning
                  ? const _CustomServices(
                      serviceName: 'Aire acondicionado',
                      icon: Icons.air_rounded)
                  : const SizedBox(),
              houseDetail.houseService.television
                  ? const _CustomServices(
                      serviceName: 'Television', icon: Icons.tv)
                  : const SizedBox(),
              houseDetail.houseService.gas
                  ? const _CustomServices(
                      serviceName: 'Gas', icon: Icons.gas_meter)
                  : const SizedBox(),
              const SizedBox(
                height: 20,
              ),
              _HorizontalLine(),
              const SizedBox(
                height: 20,
              ),
              UserInfoWidget(userDetail: userDetail,)
            ],
          ),
        )
      ],
    );
  }
}

class _CustomServices extends StatelessWidget {
  final String serviceName;
  final IconData icon;
  const _CustomServices({required this.serviceName, required this.icon});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Icon(
              icon,
              size: 25,
              color: Colors.black54,
            ),
          ),
          Text(
            serviceName,
            style: textStyle.bodyMedium
                ?.copyWith(fontSize: 15, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class _HorizontalLine extends StatelessWidget {
  final double height = .75;
  final Color color = const Color.fromARGB(255, 201, 197, 197);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color,
    );
  }
}

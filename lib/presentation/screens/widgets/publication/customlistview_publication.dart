import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/presentation/screens/widgets/publication/custom_sliverappbar_p.ublication.dart';

class CustomListView extends StatelessWidget {
  final House house;

  const CustomListView({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(publicationPost: publicationPost),
        SliverList(
            delegate:
                SliverChildBuilderDelegate(childCount: 1, (context, index) {
          return _RentalHouseDetils(
            publicationPost: publicationPost,
          );
        }))
      ],
    );
  }
}



class _RentalHouseDetils extends StatelessWidget {
  final RentalHouse publicationPost;
  const _RentalHouseDetils({required this.publicationPost});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    // final String numberOfGuests = (publicationPost.rentalHouseDetail.numberOfGuests > 1) ? '${publicationPost.rentalHouseDetail.numberOfGuests} invitados' : '1 invitado';
    // final String numberOfBathrooms = (publicationPost.rentalHouseDetail.numberOfBathrooms > 1) ? '${publicationPost.rentalHouseDetail.numberOfBathrooms} baños' : '1 baño';
    // final String numberOfRooms = (publicationPost.rentalHouseDetail.numberOfRooms > 1) ? '${publicationPost.rentalHouseDetail.numberOfRooms} cuartos' : '1 cuarto';
    // final String numberOfHammocks = (publicationPost.rentalHouseDetail.numberOfHammocks > 1) ? '${publicationPost.rentalHouseDetail.numberOfHammocks} hamacas' : '1 hamaca';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(//title
                padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 6 ),
                child: Text(
                  publicationPost.title,
                  style:
                      textStyle.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        ),
                ),
              ),

              Text(//hubication
                '${publicationPost.houseLocation.city} ${publicationPost.houseLocation.state} - ${publicationPost.houseLocation.neighborhood} - CP:${publicationPost.houseLocation.postalCode}',
                style: textStyle.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              const SizedBox(
                height: 2,
              ),

              Text(//house details
                '$numberOfGuests . $numberOfRooms . $numberOfBathrooms . $numberOfHammocks',
                style: textStyle.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.black54),
              ),

              const SizedBox(height: 20,),
              _HorizontalLine(),
              const SizedBox(height: 20,),
              
              const Text(
                'Servicios',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 15
                ),
              ),

              if (!publicationPost.houseService.wifi &&
              !publicationPost.houseService.kitchen &&
              !publicationPost.houseService.washer &&
              !publicationPost.houseService.water &&
              !publicationPost.houseService.airConditioning &&
              !publicationPost.houseService.television &&
              !publicationPost.houseService.gas)

              Text(
                'Esta casa no tiene servicios',
                style: textStyle.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              
              publicationPost.houseService.wifi
              ? const _CustomServices(icon: Icons.wifi, serviceName: 'Wifi')
              : const SizedBox(),

              publicationPost.houseService.kitchen
              ? const _CustomServices(serviceName: 'Refrigerador', icon: Icons.kitchen_rounded)
              : const SizedBox(),

              publicationPost.houseService.washer
              ? const _CustomServices(serviceName: 'Lavadora', icon: Icons.wash_rounded)
              : const SizedBox(),

              publicationPost.houseService.water
              ? const _CustomServices(serviceName: 'Agua', icon: Icons.water_drop_rounded)
              : const SizedBox(),

              publicationPost.houseService.airConditioning
              ? const _CustomServices(serviceName: 'Aire acondicionado', icon: Icons.air_rounded)
              : const SizedBox(),

              publicationPost.houseService.television
              ? const _CustomServices(serviceName: 'Television', icon: Icons.tv)
              : const SizedBox(),

              publicationPost.houseService.gas
              ? const _CustomServices(serviceName: 'Gas', icon: Icons.gas_meter)
              : const SizedBox(),
              
              const SizedBox(height: 20,),
              _HorizontalLine(),
              const SizedBox(height: 20,),
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
  const _CustomServices({
    required this.serviceName,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 12),
            child: Icon(icon, size: 25, color: Colors.black54,),
          ),
          Text(
            serviceName, 
            style: textStyle.bodyMedium?.copyWith(fontSize: 15, color: Colors.black54),
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
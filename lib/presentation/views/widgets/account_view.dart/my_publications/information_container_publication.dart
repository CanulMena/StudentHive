import 'package:flutter/material.dart';
import 'package:studenthive/domain/entities/entities.dart';

class MyPublicationInformationContainer extends StatelessWidget {
  final HousePreview informationHousePreview;
  const MyPublicationInformationContainer({super.key, required this.informationHousePreview});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return SizedBox(//! Contenedor de información
      height: size.height * 0.50 * 0.25,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                '${informationHousePreview.houseLocation.city}, ${informationHousePreview.houseLocation.neighborhood}', 
                style: textStyle.titleMedium?.copyWith( fontWeight: FontWeight.w600, fontSize: 16 )
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                '${informationHousePreview.publicationDate.year}-0${informationHousePreview.publicationDate.month}-${informationHousePreview.publicationDate.weekday}', 
                style: textStyle.labelLarge,)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: _CustomText(
                imagePost: ' \$${informationHousePreview.rentPrice.toString()} MXN',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                ),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomText extends StatelessWidget {
final double? fontSize;
  final FontWeight? fontWeight;
  final String imagePost;
  const _CustomText({
    required this.imagePost, 
    this.fontSize, 
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      imagePost,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight
      ),
      );
  }
}
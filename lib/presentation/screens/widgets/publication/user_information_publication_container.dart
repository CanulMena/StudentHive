import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/domain/entities/entities.dart';
// import 'package:studenthive/presentation/provider/providers.dart';

class UserInfoWidget extends StatefulWidget {
  const UserInfoWidget({super.key, required this.userDetail});
  final User userDetail;

  @override
  State<UserInfoWidget> createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  @override
  Widget build(BuildContext context) {
    // var userDeatil = ref.watch(userProvider);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.9,
      height: size.height * 0.3,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage(widget.userDetail.profilePhotoUrl ?? ''),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userDetail.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${widget.userDetail.userAge} años',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.userDetail.description ?? '',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

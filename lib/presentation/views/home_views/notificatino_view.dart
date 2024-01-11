import 'package:studenthive/presentation/screens/widgets/widgets_views/notifications/notification_container_1.dart';
import 'package:studenthive/presentation/screens/widgets/widgets_views/notifications/notification_container_2.dart';
import 'package:studenthive/presentation/screens/widgets/widgets_views/notifications/notification_container_3.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  final String messageConst;
  final String messageApi;

  const NotificationView({Key? key, required this.messageConst, required this.messageApi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        SizedBox(),
        NotificationContainer1(
          messageConst: messageConst,
          messageApi: messageApi,
        ),
        NotificationContainer2(
          messageConst: messageConst,
          messageApi: messageApi,
        ),
        NotificationContainer3(
          messageConst: messageConst, 
          messageApi: messageApi
        ),
        // ? Agrega más instancias según sea necesario
      ],
    );
  }
}
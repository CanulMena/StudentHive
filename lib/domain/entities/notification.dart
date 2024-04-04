import 'package:studenthive/domain/entities/user.dart';
enum NotificationType { reserve, accepted, notAccepted }
class UserNotification {
  final User user;
  final String title;
  final int notificationTime;

  UserNotification({
    required this.user,
    required this.title,
    required this.notificationTime,
  });
}

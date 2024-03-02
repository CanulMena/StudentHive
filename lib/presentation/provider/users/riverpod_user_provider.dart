import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/users/user_respository_provider.dart';

final createUserProvider = Provider((ref) => ref.watch(usersRepositoryProvider).postUser);
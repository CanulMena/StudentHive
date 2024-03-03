import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studenthive/presentation/provider/users/user_respository_provider.dart';
//*Provider, StateProvider, StateNotiferProvider, ChangeNotifierProvider, SreamNotifier... 

final createUserSesionProvider = Provider((ref) => ref.watch(usersRepositoryProvider).postUser);

final loginUserProvider = Provider((ref) => ref.watch(usersRepositoryProvider).loginUser);
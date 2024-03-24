import 'package:studenthive/domain/datasource/user_datasource.dart';
import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository{

  final UserDataSource userDataSource;  

  UserRepositoryImpl({required this.userDataSource});
  
  @override
  Future<void> postUser(String userName, String password, String email) {
    return userDataSource.postUser(userName, password, email);
  }

  @override
  Future<void> loginUser(String email, String password) {
    return userDataSource.loginUser(email, password);
  }
  
  @override
  Future<User> getUserByEmail(String email) {
    return userDataSource.getUserByEmail(email);
  }
  
  @override
  Future<User> getUserById(int id) {
    return userDataSource.getUserById(id);
  }
  

}
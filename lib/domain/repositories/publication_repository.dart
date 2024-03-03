import 'package:studenthive/domain/entities/entities.dart';

abstract class UserRepository {
  
  Future<void> postUser( String userName, String password, String email ); 

  Future<void> loginUser( String email, String password );

  Future<User> getUserById( int id );

  Future <User> getUserByEmail( String email );

}
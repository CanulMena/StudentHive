import 'package:studenthive/domain/entities/entities.dart';
import 'package:studenthive/domain/entities/user.dart';

  abstract class UserDataSource {
    
    Future<void> postUser( String userName, String password, String email ); 

    Future<void> loginUser( String email, String password);

    Future<User> getUserById( int id );

    Future <User> getUserByEmail( String email );

  }
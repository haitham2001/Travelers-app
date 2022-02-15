import 'package:travellers/constants/constants.dart';

class UserData {
   int id;
  final String userName;
  final String Email;
  final String Password;
  final String DateOfBirth;

  UserData({
     required this.id,
    required this.userName,
    required this.Email,
    required this.Password,
    required this.DateOfBirth}
    );

 static late UserData LoggedUser;
 static late UserData idx;

}

// ignore_for_file: file_names
import 'package:objectbox/objectbox.dart';

@Entity()
class User {

  String email;
  String password;
  int id = 0;

  User({ required this.email, required this.password});
}

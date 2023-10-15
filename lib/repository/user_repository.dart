import 'package:gerencia_estado_estudo/model/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getUser();
}

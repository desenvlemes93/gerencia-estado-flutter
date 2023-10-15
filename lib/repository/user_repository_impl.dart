import 'package:dio/dio.dart';
import 'package:gerencia_estado_estudo/model/user.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<User>> getUser() async {
    try {
      final _dio = Dio();

      final result = await _dio.get('http://192.168.0.103:8080/users');
      print('print do result  ${result.data}');

      return result.data.map<User>((e) => User.fromMap(e)).toList();
    } on Exception catch (e) {
      throw Exception(
        'Erro ao buscar dados',
      );
    }
  }
}

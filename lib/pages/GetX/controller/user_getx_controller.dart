import 'package:gerencia_estado_estudo/model/user.dart';
import 'package:gerencia_estado_estudo/repository/user_repository.dart';
import 'package:gerencia_estado_estudo/repository/user_repository_impl.dart';
import 'package:get/get.dart';

class UserGetxController extends GetxController {
  UserRepository userRepository;

  final _useList = <User>[].obs;
  final _loading = false.obs;
  final _tamanho = 0.obs;
  UserGetxController({
    required this.userRepository,
  });

  bool get loading => _loading.value;

  List<User> get usuarios => _useList;

  int get tamanho => _tamanho.value;

  Future<void> buscarUser() async {
    _loading(true);
    final usuarios = await userRepository.getUser();
    _tamanho.value = usuarios.length;
    _useList(usuarios);
    _loading(false);
  }
}

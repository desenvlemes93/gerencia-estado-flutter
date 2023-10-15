import 'package:gerencia_estado_estudo/repository/user_repository.dart';

import 'package:get/get.dart';

import 'package:gerencia_estado_estudo/model/user.dart';

class UserControllerStateMixin extends GetxController with StateMixin<User> {
  UserRepository userRepository;
  UserControllerStateMixin({required this.userRepository});

  @override
  void onReady() {
    change(state, status: RxStatus.empty());
    super.onReady();
  }

  Future<void> findUser() async {
    change(state, status: RxStatus.loading());

    final _user = await userRepository.getUser();

    _user.map((e) => change(e, status: RxStatus.success())).toList();
  }
}

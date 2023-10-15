import 'package:flutter/material.dart';
import 'package:gerencia_estado_estudo/pages/Bloc/controller/busca_user_controller.dart';
import 'package:gerencia_estado_estudo/pages/Bloc/controller/busca_user_state.dart';
import 'package:gerencia_estado_estudo/pages/GetX/controller/user_getx_controller.dart';
import 'package:gerencia_estado_estudo/pages/GetX/user_controller_state_mixin.dart';
import 'package:gerencia_estado_estudo/repository/user_repository.dart';
import 'package:gerencia_estado_estudo/repository/user_repository_impl.dart';
import 'package:get/get.dart';

class UserGetxPage extends StatefulWidget {
  const UserGetxPage({super.key});

  @override
  State<UserGetxPage> createState() => _UserGetxPageState();
}

class _UserGetxPageState extends State<UserGetxPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl());
    Get.lazyPut(() => UserGetxController(userRepository: Get.find()));
    final controller = Get.find<UserGetxController>();
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl());
    Get.lazyPut(() => UserGetxController(userRepository: Get.find()));
    controller.buscarUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Page'),
      ),
      body: ListView.builder(
        itemCount: controller.tamanho,
        itemBuilder: (context, index) {
          controller.buscarUser();
          var usuario = controller.usuarios[index];
          return Column(
            children: [
              Wrap(
                children: [
                  ExpansionTile(
                      title: Text(usuario.nome,
                          style: TextStyle(fontSize: 20, color: Colors.red)),
                      children: [Text(usuario.email)]),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

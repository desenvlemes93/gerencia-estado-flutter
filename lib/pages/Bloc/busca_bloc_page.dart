import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerencia_estado_estudo/pages/Bloc/controller/busca_user_controller.dart';
import 'package:gerencia_estado_estudo/pages/Bloc/controller/busca_user_state.dart';

class BuscaBlocPage extends StatefulWidget {
  const BuscaBlocPage({super.key});

  @override
  State<BuscaBlocPage> createState() => _BuscaBlocPageState();
}

class _BuscaBlocPageState extends State<BuscaBlocPage> {
  @override
  void initState() {
    context.read<BuscaUserController>().buscarUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Page'),
      ),
      body: BlocConsumer<BuscaUserController, BuscaUserState>(
        listener: (context, state) {},
        builder: (context, state) {
          return switch (state) {
            BuscaUserLoaded(listaUser: var listUsers) => ListView.builder(
                itemCount: listUsers.length,
                itemBuilder: (context, index) {
                  var usuarios = listUsers[index];
                  return Column(
                    children: [
                      Wrap(
                        children: [
                          ExpansionTile(
                            title: Text(usuarios.nome),
                            children: [
                              Text(usuarios.email),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                }),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}

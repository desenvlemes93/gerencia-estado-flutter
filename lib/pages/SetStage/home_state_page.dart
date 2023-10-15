import 'package:flutter/material.dart';
import 'package:gerencia_estado_estudo/pages/SetStage/presenter/home_presenter.dart';
import 'package:gerencia_estado_estudo/pages/SetStage/view/home_view_impl.dart';

class HomeStatePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomeStatePage({
    super.key,
    required this.presenter,
  });

  @override
  State<HomeStatePage> createState() => _HomeStatePageState();
}

class _HomeStatePageState extends HomeViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SetState'),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (_, index) {
            var usuarios = users[index];
            return Container(
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(users.length != 0 ? usuarios.nome : 'Nao Existe'),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

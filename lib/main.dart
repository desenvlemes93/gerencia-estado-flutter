import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerencia_estado_estudo/pages/Bloc/busca_bloc_page.dart';
import 'package:gerencia_estado_estudo/pages/Bloc/controller/busca_user_controller.dart';
import 'package:gerencia_estado_estudo/pages/GetX/user_getx_page.dart';
import 'package:gerencia_estado_estudo/pages/Provider/provider_user_page.dart';
import 'package:gerencia_estado_estudo/pages/SetStage/presenter/home_presenter.dart';
import 'package:gerencia_estado_estudo/pages/SetStage/presenter/home_presenter_impl.dart';
import 'package:gerencia_estado_estudo/pages/home_page.dart';
import 'package:gerencia_estado_estudo/pages/SetStage/home_state_page.dart';
import 'package:gerencia_estado_estudo/repository/user_repository.dart';
import 'package:gerencia_estado_estudo/repository/user_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl()),
        Bind.lazySingleton<HomePresenter>(
            (i) => HomePresenterImpl(userRepository: i())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        routes: {
          '/pages/SetState': (_) => HomeStatePage(
                presenter: context.get(),
              ),
          '/pages/Bloc': (_) => BlocProvider(
                create: (_) => BuscaUserController(),
                child: const BuscaBlocPage(),
              ),
          '/pages/Riverpod': (_) => const ProviderScope(
                child: ProviderUserPage(),
              ),
          '/pages/GetX': (_) => const UserGetxPage(),
        },
      ),
    );
  }
}

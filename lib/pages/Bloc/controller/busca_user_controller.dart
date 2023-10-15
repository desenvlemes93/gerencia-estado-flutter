import 'package:bloc/bloc.dart';
import 'package:gerencia_estado_estudo/pages/Bloc/controller/busca_user_state.dart';
import 'package:gerencia_estado_estudo/repository/user_repository.dart';
import 'package:gerencia_estado_estudo/repository/user_repository_impl.dart';

class BuscaUserController extends Cubit<BuscaUserState> {
  BuscaUserController() : super(BuscaUserInitial());



  Future<void> buscarUser() async{
    UserRepository userRepository = UserRepositoryImpl();

    emit(BuscaUserInitial());
    var usuario = await userRepository.getUser();
    emit(BuscaUserLoaded(usuario));

  }

}

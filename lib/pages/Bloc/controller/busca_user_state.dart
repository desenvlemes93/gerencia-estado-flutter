import 'package:gerencia_estado_estudo/model/user.dart';

sealed class BuscaUserState {}

class BuscaUserInitial extends BuscaUserState {}

class BuscaUserLoaded extends BuscaUserState {
  var listaUser = <User>[];
  BuscaUserLoaded(this.listaUser);
}

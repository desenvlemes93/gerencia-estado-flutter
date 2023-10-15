import 'package:flutter/material.dart';
import 'package:gerencia_estado_estudo/model/user.dart';
import 'package:gerencia_estado_estudo/pages/SetStage/home_state_page.dart';
import 'package:gerencia_estado_estudo/pages/SetStage/view/home_view.dart';

abstract class HomeViewImpl extends State<HomeStatePage> implements HomeView {
  User? user;
  var users = <User>[];

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.presenter.getUserData();
    });
    super.initState();
  }

  @override
  void updateUser(User user) {
    setState(() {
      if (user.nome != '') {
        this.user = user;
      } else {
        this.user = User(
          id: 0,
          nome: '',
          email: '',
        );
      }
    });
  }

  @override
  void addUsers(User user) {
    setState(() {
      users.add(user);
    });
  }
}

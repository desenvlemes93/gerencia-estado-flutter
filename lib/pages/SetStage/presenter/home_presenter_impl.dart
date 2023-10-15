import 'package:gerencia_estado_estudo/pages/SetStage/presenter/home_presenter.dart';
import 'package:gerencia_estado_estudo/pages/SetStage/view/home_view.dart';
import 'package:gerencia_estado_estudo/repository/user_repository.dart';

class HomePresenterImpl implements HomePresenter {
  final UserRepository userRepository;
  late HomeView _view;

  HomePresenterImpl({
    required this.userRepository,
  });

  @override
  Future getUserData() async {
    final user = await userRepository.getUser();

    user
        .map(
          (usuariosList) => _view.addUsers(usuariosList),
        )
        .toList();
  }

  @override
  set view(HomeView view) => _view = view;
}

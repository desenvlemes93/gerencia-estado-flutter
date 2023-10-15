enum UserStateStatus {
  initial,
  sucesso,
}

class UserProviderState {
  final UserStateStatus status;

  UserProviderState.initial()
      : this(
          status: UserStateStatus.initial,
        );
  UserProviderState({
    required this.status,
  });

  UserProviderState copyWith({
    UserStateStatus? status,
  }) {
    return UserProviderState(status: status ?? this.status);
  }
}

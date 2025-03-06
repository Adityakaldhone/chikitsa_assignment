
import 'package:equatable/equatable.dart';

enum SignInStatus { initial, loading, loaded, error }

class SignInState extends Equatable {
  final SignInStatus? status;


  const SignInState({
    this.status
  });

  static SignInState initial() {
    return const SignInState(
      status: SignInStatus.initial
    );
  }

  SignInState clone({
    SignInStatus? status
  }) {
    return SignInState(
      status: status ?? this.status
    );
  }

  @override
  List<Object?> get props => [
        status
        // Add counts to the props list for comparison
      ];
}

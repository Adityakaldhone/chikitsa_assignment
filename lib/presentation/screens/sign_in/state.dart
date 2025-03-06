
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

/*************  ✨ Codeium Command ⭐  *************/
/// Creates a copy of the current `SignInState` with updated fields.
/// 
/// If a non-null `status` is provided, it will replace the current status.
/// Otherwise, the existing status will be used.
/// 
/// Returns a new instance of `SignInState`.

/******  1f53881d-8c54-4681-85a0-a90ee27af0cb  *******/
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

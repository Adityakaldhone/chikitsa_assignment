import 'package:chikitsa_assign/presentation/screens/sign_in/event.dart';
import 'package:chikitsa_assign/presentation/screens/sign_in/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {
    on<InitEvent>(_init);

  }

  Future<void> _init(SignInEvent event, Emitter<SignInState> emit) async {

    emit(state.clone(status: SignInStatus.loading));


    emit(state.clone(status: SignInStatus.loaded));
    
  }

}

import 'package:chikitsa_assign/presentation/screens/profile_screen/event.dart';
import 'package:chikitsa_assign/presentation/screens/profile_screen/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<LoadProfileEvent>(_onLoadProfile);
  }

  void _onLoadProfile(
      LoadProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ProfileStatus.loading));

    // Simulate some loading time (you could fetch user data here in real case)
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(status: ProfileStatus.loaded));
  }
}

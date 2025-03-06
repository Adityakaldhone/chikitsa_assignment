import 'package:chikitsa_assign/presentation/screens/navbar/event.dart';
import 'package:chikitsa_assign/presentation/screens/navbar/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarState.initial()) {
    on<ChangeNavbarTabEvent>(_onChangeTab);
  }

  void _onChangeTab(ChangeNavbarTabEvent event, Emitter<NavbarState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }
}

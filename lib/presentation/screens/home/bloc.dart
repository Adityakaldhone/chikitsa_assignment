
import 'package:chikitsa_assign/presentation/screens/home/event.dart';
import 'package:chikitsa_assign/presentation/screens/home/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<InitEvent>(_init);

  }

  Future<void> _init(HomeEvent event, Emitter<HomeState> emit) async {

    emit(state.clone(status: HomeStatus.loading));


    emit(state.clone(status: HomeStatus.loaded));
    
  }

}

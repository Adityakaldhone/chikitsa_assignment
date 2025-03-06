import 'package:chikitsa_assign/presentation/screens/home_screen/event.dart';
import 'package:chikitsa_assign/presentation/screens/home_screen/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportState.initial()) {
    on<LoadReportEvent>(_onLoadReport);
    on<ChangeTabEvent>(_onChangeTab);
  }

  Future<void> _onLoadReport(
      LoadReportEvent event, Emitter<ReportState> emit) async {
    emit(state.copyWith(status: ReportStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(status: ReportStatus.loaded));
  }

  void _onChangeTab(ChangeTabEvent event, Emitter<ReportState> emit) {
    emit(state.copyWith(currentTabIndex: event.tabIndex));
  }
}

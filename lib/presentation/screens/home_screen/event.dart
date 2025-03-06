import 'package:equatable/equatable.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object?> get props => [];
}

// Original event
class LoadReportEvent extends ReportEvent {}

// New event - for bottom nav click
class ChangeTabEvent extends ReportEvent {
  final int tabIndex;

  const ChangeTabEvent(this.tabIndex);

  @override
  List<Object?> get props => [tabIndex];
}

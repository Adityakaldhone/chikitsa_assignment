import 'package:equatable/equatable.dart';

enum ReportStatus { initial, loading, loaded, error }

class ReportState extends Equatable {
  final ReportStatus status;
  final int currentTabIndex;

  const ReportState({
    required this.status,
    required this.currentTabIndex,
  });

  factory ReportState.initial() => const ReportState(
        status: ReportStatus.initial,
        currentTabIndex: 1, // Default to "Report" tab
      );

  ReportState copyWith({
    ReportStatus? status,
    int? currentTabIndex,
  }) {
    return ReportState(
      status: status ?? this.status,
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
    );
  }

  @override
  List<Object?> get props => [status, currentTabIndex];
}

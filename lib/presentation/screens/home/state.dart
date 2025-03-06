
import 'package:equatable/equatable.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStatus? status;


  const HomeState({
    this.status
  });

  static HomeState initial() {
    return const HomeState(
      status: HomeStatus.initial
    );
  }

  HomeState clone({
    HomeStatus? status
  }) {
    return HomeState(
      status: status ?? this.status
    );
  }

  @override
  List<Object?> get props => [
        status
        // Add counts to the props list for comparison
      ];
}

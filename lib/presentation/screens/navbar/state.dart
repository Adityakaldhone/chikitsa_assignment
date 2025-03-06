import 'package:equatable/equatable.dart';

class NavbarState extends Equatable {
  final int currentIndex;

  const NavbarState({required this.currentIndex});

  factory NavbarState.initial() => const NavbarState(currentIndex: 1); // Default to "Report"

  NavbarState copyWith({int? currentIndex}) {
    return NavbarState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object?> get props => [currentIndex];
}

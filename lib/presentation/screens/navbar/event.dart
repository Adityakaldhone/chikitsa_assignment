import 'package:equatable/equatable.dart';

abstract class NavbarEvent extends Equatable {
  const NavbarEvent();

  @override
  List<Object?> get props => [];
}

class ChangeNavbarTabEvent extends NavbarEvent {
  final int index;

  const ChangeNavbarTabEvent(this.index);

  @override
  List<Object?> get props => [index];
}

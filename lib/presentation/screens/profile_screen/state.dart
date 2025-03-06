import 'package:equatable/equatable.dart';

enum ProfileStatus { initial, loading, loaded, error }

class ProfileState extends Equatable {
  final ProfileStatus status;

  const ProfileState({required this.status});

  factory ProfileState.initial() => const ProfileState(status: ProfileStatus.initial);

  ProfileState copyWith({ProfileStatus? status}) {
    return ProfileState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}

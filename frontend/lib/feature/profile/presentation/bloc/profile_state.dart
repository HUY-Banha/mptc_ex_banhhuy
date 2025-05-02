part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final List<Profile> profiles;

  ProfileLoaded({required this.profiles});
  @override
  String toString() => 'ProfileLoaded { profiles: $profiles }';
}
final class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}

final class ProfileSelectedState extends ProfileState {
  final Profile profile;

  ProfileSelectedState({required this.profile});
  
  @override
  String toString() => 'ProfileSelectedState { profileId: ${profile.toJson()} }';
}

// ProfileSaved
final class ProfileSaved extends ProfileState {
  final String message;

  ProfileSaved({required this.message});
  @override
  String toString() => 'ProfileSaved { message: $message }';
}

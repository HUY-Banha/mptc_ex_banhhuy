part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class ProfileStarted extends ProfileEvent {
  
}


final class ProfileGetProfile extends ProfileEvent {
  ProfileGetProfile();
}

final class ProfileSelected extends ProfileEvent {
  final String profileId;

  ProfileSelected({required this.profileId});
}

//FilterProfiles
final class FilterProfiles extends ProfileEvent {
  final String? filter;
  final String? query;

  FilterProfiles({this.filter, this.query});
}

//AddProfile
final class AddProfile extends ProfileEvent {
  final Profile profile;
  final File? imageFile;

  AddProfile({required this.profile,this.imageFile,});

  @override
  String toString() => 'AddProfile { profile: ${profile.toJson()} }';
}

// UpdateProfile
final class UpdateProfile extends ProfileEvent {
  final Profile profile;
  final File? imageFile;

  UpdateProfile({required this.profile, this.imageFile});

  @override
  String toString() => 'UpdateProfile { profile: ${profile.toJson()} }';
}

// DeleteProfile
final class DeleteProfile extends ProfileEvent {
  final String profileId;

  DeleteProfile({required this.profileId});

  @override
  String toString() => 'DeleteProfile { profileId: $profileId }';
}

// Share Profile
final class ShareProfile extends ProfileEvent {
  final Profile profile;

  ShareProfile({required this.profile});

  @override
  String toString() => 'ShareProfile { profileId: ${profile.toJson()} }';
}
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/data/model/profile.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/domain/usecases/profile_usecase.dart';
import 'package:share_plus/share_plus.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUsecase _usecase;

  List<Profile> profilesList = [];

  ProfileBloc(this._usecase) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      // TODO: implement event handler
    });

    // Add Profile
    on<AddProfile>(_addProfile);
    // Update Profile
    on<UpdateProfile>(_updateProfile);
    // Delete Profile
    on<DeleteProfile>(_deleteProfile);

    // Share Profile
    on<ShareProfile>(_shareProfile);

    on<ProfileStarted>((event, emit) async {
      try {
        emit(ProfileLoading());
        final profiles = await _usecase.call();
        profiles.fold(
          (failure) {
            emit(ProfileError(message: failure.message));
          },
          (profiles) {
            profilesList = profiles;
            emit(ProfileLoaded(profiles: profiles));
          },
        );
      } catch (e) {
        emit(ProfileError(message: e.toString()));
      }
    });

    on<ProfileSelected>((event, emit) {
      final profile =
          profilesList.firstWhere((profile) => profile.id == event.profileId);
      emit(ProfileSelectedState(profile: profile));
    });

    List<String> mobileKeywords = [
      'flutter',
      'react native',
      'native',
      'kotlin',
      'swift',
      'android',
      'ios'
    ];
    List<String> webKeywords = [
      'web',
      'angular',
      'react',
      'vue',
      'html',
      'css',
      'javascript',
      'typescript'
    ];
    List<String> backendKeywords = [
      'backend',
      'nodejs',
      'express',
      'django',
      'flask',
      'spring',
      'java',
      'python',
      'ruby'
    ];
    List<String> devopsKeywords = [
      'devops',
      'docker',
      'kubernetes',
      'aws',
      'azure',
      'gcp',
      'terraform',
      'ansible'
    ];
    List<String> uxUiKeywords = [
      'ux',
      'ui',
      'design',
      'figma',
      'adobe',
      'photoshop',
      'illustrator',
      'sketch'
    ];

    //FilterProfiles
    on<FilterProfiles>((event, emit) {
      List<Profile> filteredProfiles = profilesList;

      bool matchesKeyword(Profile profile, List<String> keywords) {
        return keywords.any((keyword) =>
            profile.skills?.any(
                    (skill) => skill.name!.toLowerCase().contains(keyword)) ==
                true ||
            profile.role?.toLowerCase().contains(keyword) == true);
      }

      final filter = event.filter?.toLowerCase().trim();
      final query = event.query?.toLowerCase().trim();

      // Filtering by filter category (e.g., 'mobile', 'web', etc.)
      if (filter != null && filter.isNotEmpty && filter != 'all') {
        if (filter.contains('mobile')) {
          filteredProfiles = profilesList
              .where((profile) => matchesKeyword(profile, mobileKeywords))
              .toList();
        } else if (filter.contains('web')) {
          filteredProfiles = profilesList
              .where((profile) => matchesKeyword(profile, webKeywords))
              .toList();
        } else if (filter.contains('backend')) {
          filteredProfiles = profilesList
              .where((profile) => matchesKeyword(profile, backendKeywords))
              .toList();
        } else if (filter.contains('devops')) {
          filteredProfiles = profilesList
              .where((profile) => matchesKeyword(profile, devopsKeywords))
              .toList();
        } else if (filter.contains('ux') || filter.contains('ui')) {
          filteredProfiles = profilesList
              .where((profile) => matchesKeyword(profile, uxUiKeywords))
              .toList();
        }
      }

      // Further filtering by search query
      if (query != null && query.isNotEmpty) {
        filteredProfiles = filteredProfiles.where((profile) {
          final name = profile.name?.toLowerCase() ?? '';
          final role = profile.role?.toLowerCase() ?? '';
          final skills = profile.skills ?? [];

          return name.contains(query) ||
              role.contains(query) ||
              skills.any(
                  (skill) => skill.name?.toLowerCase().contains(query) == true);
        }).toList();
      }

      emit(ProfileLoaded(profiles: filteredProfiles));
    });
  }

  void _addProfile(AddProfile event, Emitter<ProfileState> emit) async {
    log("""message : ${event.profile.toJson()}""");
    profilesList.add(event.profile);
    emit(ProfileSaved(message: "Profile added successfully"));
    emit(ProfileLoaded(profiles: profilesList));
  }

  void _updateProfile(UpdateProfile event, Emitter<ProfileState> emit) async {
    log("""message : ${event.profile.toJson()}""");

    final index =
        profilesList.indexWhere((profile) => profile.id == event.profile.id);
    if (index != -1) {
      profilesList[index] = event.profile;
    }
    emit(ProfileSaved(message: "Profile updated successfully"));
    emit(ProfileLoaded(profiles: profilesList));
  }

  void _deleteProfile(DeleteProfile event, Emitter<ProfileState> emit) async {
    log("""message : ${event.profileId}""");
    final index =
        profilesList.indexWhere((profile) => profile.id == event.profileId);
    if (index != -1) {
      profilesList.removeAt(index);
    }
    emit(ProfileSaved(message: "Profile deleted successfully"));
    emit(ProfileLoaded(profiles: profilesList));
  }

  void _shareProfile(ShareProfile event, Emitter<ProfileState> emit) async {
    final profile = event.profile;
    final shareText = '''
📄 *${profile.name}* - ${profile.role}

📧 ${profile.contractMethod?.email ?? "No email"}
🔗 LinkedIn: ${profile.contractMethod?.linkedIn ?? "Not available"}
💬 GitHub: ${profile.contractMethod?.github ?? "Not available"}

📝 Bio:
${profile.bio ?? "No bio"}

Sent via MyApp
''';
    await SharePlus.instance.share(ShareParams(text: shareText));
  }
}

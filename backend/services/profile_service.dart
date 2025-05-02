// services/profile_service.dart
import 'package:backend/models/category.dart';
import 'package:backend/models/contact_method.dart';
import 'package:backend/models/profile.dart';
import 'package:uuid/uuid.dart';

class ProfileService {
  final List<Profile> _profiles = [
    const Profile(
      id: '1',
      name: 'Jane Doe',
      role: 'Flutter Developer',
      skills: <Category>[
        Category(id: 1, name: 'Flutter'),
        Category(id: 2, name: 'Dart'),
        Category(id: 3, name: 'Firebase'),
        Category(id: 4, name: 'REST APIs'),
      ],
      bio: 'Experienced Flutter developer',
      photoUrl: 'https://conferenceoeh.com/wp-content/uploads/profile-pic-dummy.png',
      contact: ContactMethod(
        email: 'jane@example.com',
        linkedIn: 'https://linkedin.com/in/janedoe',
        github: 'https://github.com/janedoe',
      ),
    ),
    const Profile(
      id: '2',
      name: 'John Smith',
      role: 'Backend Developer',
      skills: <Category>[
        Category(id: 5, name: 'Node.js'),
        Category(id: 6, name: 'Express'),
        Category(id: 7, name: 'MongoDB'),
        Category(id: 8, name: 'GraphQL'),
      ],
      bio: 'Skilled backend developer with Node.js experience',
      photoUrl: 'https://example.com/john.jpg',
      contact: ContactMethod(
        email: 'john@example.com',
        linkedIn: 'https://linkedin.com/in/johnsmith',
        github: 'https://github.com/johnsmith',
      ),
    ),
    const Profile(
      id: '3',
      name: 'Alice Johnson',
      role: 'Frontend Developer',
      skills: <Category>[
        Category(id: 9, name: 'React'),
        Category(id: 10, name: 'JavaScript'),
        Category(id: 11, name: 'CSS'),
        Category(id: 12, name: 'HTML'),
      ],
      bio: 'Creative frontend developer with a passion for design',
      photoUrl: 'https://example.com/alice.jpg',
      contact: ContactMethod(
        email: 'alice@example.com',
        linkedIn: 'https://linkedin.com/in/alicejohnson',
        github: 'https://github.com/alicejohnson',
      ),
    ),
    const Profile(
      id: '4',
      name: 'Bob Brown',
      role: 'DevOps Engineer',
      skills: <Category>[
      Category(id: 13, name: 'AWS'),
      Category(id: 14, name: 'Docker'),
      Category(id: 15, name: 'Kubernetes'),
      Category(id: 16, name: 'CI/CD'),
      ],
      bio: 'DevOps engineer with expertise in cloud infrastructure and automation',
      photoUrl: 'https://example.com/bob.jpg',
      contact: ContactMethod(
      email: 'bob@example.com',
      linkedIn: 'https://linkedin.com/in/bobbrown',
      github: 'https://github.com/bobbrown',
      ),
    ),
  ];

  List<Profile> getAllProfiles() => _profiles;

  Profile? getProfileById(String id) => _profiles.firstWhere(
        (p) => p.id == id,
        orElse: () => throw Exception('Profile not found'),
      );

  Profile addProfile(Profile profile) {
    final newProfile = profile.copyWith(id: const Uuid().v4());
    _profiles.add(newProfile);
    return newProfile;
  }

  bool updateProfile(String id, Profile updatedProfile) {
    final index = _profiles.indexWhere((p) => p.id == id);
    if (index == -1) return false;
    _profiles[index] = updatedProfile.copyWith(id: id);
    return true;
  }

  bool deleteProfile(String id) {
    final initialLength = _profiles.length;
    _profiles.removeWhere((p) => p.id == id);
    return _profiles.length <
        initialLength; // Returns true if a profile was removed
  }
}

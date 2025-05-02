import 'package:backend/models/category.dart';
import 'package:backend/models/contact_method.dart';
import 'package:backend/models/profile.dart';
import 'package:test/test.dart';

import '../../services/profile_service.dart';

void main() {
  final service = ProfileService();

  test('returns all profiles', () {
    final profiles = service.getAllProfiles();
    expect(profiles, isNotEmpty);
  });

  test('adds a profile', () {
    const newProfile = Profile(
      id: '',
      name: 'Test User',
      role: 'Tester',
      skills: [
        Category(id: 1, name: 'Testing'),
        Category(id: 2, name: 'Automation'),
        Category(id: 3, name: 'Selenium'),
        Category(id: 4, name: 'JIRA'),
      ],
      bio: 'QA Expert',
      photoUrl: '',
      contact: ContactMethod(email: 'C9yjF@example.com', linkedIn: '', github: ''),
    );

    final created = service.addProfile(newProfile);
    expect(created.id, isNotEmpty);
    expect(service.getAllProfiles().length, greaterThan(1));
  });
}

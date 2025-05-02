import 'package:backend/models/profile.dart';
import 'package:dart_frog/dart_frog.dart';

import '../../services/profile_service.dart';

final profileService = ProfileService();

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.get) {
    final profiles = profileService.getAllProfiles();
    return Response.json(body: profiles.map((e) => e.toJson()).toList());
  }

  if (context.request.method == HttpMethod.post) {
    final body = await context.request.json() as Map<String, dynamic>;
    final newProfile = Profile.fromJson(body);
    final created = profileService.addProfile(newProfile);
    return Response.json(body: created.toJson(), statusCode: 201);
  }

  return Response(statusCode: 405);
}

import 'package:backend/models/profile.dart';
import 'package:dart_frog/dart_frog.dart';

import '../../services/profile_service.dart';

final profileService = ProfileService();

Future<Response> onRequest(RequestContext context, String id) async {
  switch (context.request.method) {
    case HttpMethod.get:
      final profile = profileService.getProfileById(id);
      return profile != null
          ? Response.json(body: profile.toJson())
          : Response(statusCode: 404);
    case HttpMethod.put:
      final body = await context.request.json() as Map<String, dynamic>;
      final updated = Profile.fromJson(body);
      final success = profileService.updateProfile(id, updated);
      return success ? Response(statusCode: 200) : Response(statusCode: 404);
    case HttpMethod.delete:
      final success = profileService.deleteProfile(id);
      return success ? Response(statusCode: 204) : Response(statusCode: 404);
    default:
      return Response(statusCode: 405);
  }
}

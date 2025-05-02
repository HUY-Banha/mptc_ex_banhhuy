import 'package:dart_frog/dart_frog.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

const _jwtSecret = 'your_super_secret_key'; // Same as in login

Future<Response> onRequest(RequestContext context) async {
  final authHeader = context.request.headers['authorization'];

  if (authHeader == null || !authHeader.startsWith('Bearer ')) {
    return Response.json(
      statusCode: 401,
      body: {'error': 'Missing or invalid Authorization header'},
    );
  }

  final token = authHeader.substring(7); // Remove 'Bearer '

  try {
    final jwt = JWT.verify(token, SecretKey(_jwtSecret));

    // Access payload
    final payload = jwt.payload as Map<String, dynamic>;

    return Response.json(
      body: {
        'id': payload['id'],
        'username': payload['username'],
        'role': payload['role'],
      },
    );
  } catch (e) {
    print("""object $e""");
    return Response.json(
      statusCode: 401,
      body: {'error': 'Invalid token', 'details': e.toString()},
    );
  }
}

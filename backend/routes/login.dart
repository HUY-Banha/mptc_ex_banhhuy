import 'dart:convert';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

const _jwtSecret = 'your_super_secret_key'; // Store this securely!

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response.json(
      statusCode: 405,
      body: {'error': 'Method Not Allowed'},
    );
  }

  try {
    final data = await context.request.json() as Map<String, dynamic>;
    final username = data['username']?.toString();
    final password = data['password']?.toString();

    if (username == null || password == null) {
      return Response.json(
        statusCode: 400,
        body: {'error': 'Missing username or password'},
      );
    }

    // Dummy validation
    if (username == 'admin' && password == '123456') {
      final jwt = JWT(
        {
          'id': 1,
          'username': username,
          'role': 'admin',
        },
        issuer: 'my_app',
      );

      final token =
          jwt.sign(SecretKey(_jwtSecret), expiresIn: Duration(hours: 1));

      return Response.json(
        body: {'message': 'Login successful', 'token': token},
      );
    } else {
      return Response.json(
        statusCode: 401,
        body: {'error': 'Invalid username or password'},
      );
    }
  } catch (e) {
    return Response.json(
      statusCode: 500,
      body: {'error': 'Internal Server Error', 'details': e.toString()},
    );
  }
}

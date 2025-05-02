import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return (context) async {
    final request = context.request;
    print('[${request.method}] ${request.uri}');
    return handler(context);
  };
}

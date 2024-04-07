import 'package:flutter_riverpod/flutter_riverpod.dart';

final sessionProvider =
    Provider<Session>((_) => Session(isLoggedIn: false, token: ''));

class Session {
  final String token;
  final bool isLoggedIn;

  Session({required this.token, required this.isLoggedIn});
}

import 'package:firebase_auth/firebase_auth.dart' as firebase show User;
import 'package:flutter/material.dart';

@immutable
class AuthUser {
  final String? email;
  final bool isEmailVerified;
  final DateTime? creationTime;

  const AuthUser({
    required this.email,
    required this.isEmailVerified,
    required this.creationTime,
  });

  factory AuthUser.fromFirebase(firebase.User user) => AuthUser(
        email: user.email,
        isEmailVerified: user.emailVerified,
        creationTime: user.metadata.creationTime,
      );
}

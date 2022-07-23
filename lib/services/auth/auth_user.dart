import 'package:firebase_auth/firebase_auth.dart' as firebase show User;
import 'package:flutter/material.dart';

@immutable
class AuthUser {
  final String id;
  final String email;
  final bool isEmailVerified;
  final DateTime? creationTime;

  const AuthUser({
    required this.id,
    required this.email,
    required this.isEmailVerified,
    required this.creationTime,
  });

  factory AuthUser.fromFirebase(firebase.User user) => AuthUser(
        id: user.uid,
        email: user.email!,
        isEmailVerified: user.emailVerified,
        creationTime: user.metadata.creationTime,
      );
}

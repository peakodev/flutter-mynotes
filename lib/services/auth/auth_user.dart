import 'package:firebase_auth/firebase_auth.dart' as firebase show User;
import 'package:flutter/material.dart';

@immutable
class AuthUser {
  final String? email;
  final bool isEmailVerified;
  final DateTime? creationTime;

  const AuthUser(this.email, this.isEmailVerified, this.creationTime);

  factory AuthUser.fromFirebase(firebase.User user) =>
      AuthUser(user.email, user.emailVerified, user.metadata.creationTime);
}

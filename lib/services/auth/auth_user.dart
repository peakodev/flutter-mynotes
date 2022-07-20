import 'package:firebase_auth/firebase_auth.dart' as firebase show User;
import 'package:flutter/material.dart';

@immutable
class AuthUser {
  final bool isEmailVerified;

  const AuthUser(this.isEmailVerified);

  factory AuthUser.fromFirebase(firebase.User user) =>
      AuthUser(user.emailVerified);
}

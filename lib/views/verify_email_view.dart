import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify email'),
      ),
      body: Column(
        children: [
          const Text(
              'We\'ve sent you email verification. Please opent it to verify your account.'),
          const Text(
              'If you haven\'t receive a verification email yet, please press a button below.'),
          const Text('Please verify your email address:'),
          TextButton(
              onPressed: () async {
                final currentUser = FirebaseAuth.instance.currentUser;
                await currentUser?.sendEmailVerification();
              },
              child: const Text('Send email verification')),
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(registerRoute, (_) => false);
              },
              child: const Text('Restart')),
        ],
      ),
    );
  }
}

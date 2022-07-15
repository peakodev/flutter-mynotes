import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/views/notes_view.dart';

class UserInformaion extends StatelessWidget {
  const UserInformaion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? '';
    final creationTime = user?.metadata.creationTime?.toIso8601String() ?? '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('User information'),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(notesRoute, (route) => false);
          },
        ),
      ),
      body: Column(
        children: [
          Text('Your email is: $email'),
          Text('You\'ve created the account at $creationTime'),
        ],
      ),
    );
  }
}

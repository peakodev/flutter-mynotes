import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';

class UserInformaionView extends StatelessWidget {
  const UserInformaionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = AuthService.firebase().currentUser;
    final email = user?.email ?? '';
    final creationTime = user?.creationTime?.toIso8601String() ?? '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('User information'),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              notesRoute,
              (route) => false,
            );
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import 'package:mynotes/services/auth/bloc/auth_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';
import 'package:mynotes/services/auth/bloc/auth_state.dart';
import 'package:mynotes/utilities/dialogs/cannot_share_empty_note_dialog.dart';
import 'package:mynotes/utilities/dialogs/error_dialog.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late final TextEditingController _email;

  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateResetPassword) {
          if (state.exception is UserNotFoundAuthException) {
            await showErrorDialog(context, 'Wrong credentials');
          } else if (state.exception is InvalidEmailAuthException) {
            await showErrorDialog(context, 'This is an invalid email');
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(context, 'Authentication error');
          }
          if (state.emailSent) {
            await showCannotShareEmptyNoteDialog(context);
          }
        }
      },
      child: Scaffold(
          appBar: AppBar(title: const Text('Reset password')),
          body: Column(
            children: [
              TextField(
                controller: _email,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    const InputDecoration(hintText: 'Enter your email here'),
              ),
              TextButton(
                onPressed: () async {
                  context.read<AuthBloc>().add(
                        AuthEventResetPassword(
                          email: _email.text,
                        ),
                      );
                },
                child: const Text('Reset password'),
              ),
              TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                        const AuthEventLogOut(),
                      );
                },
                child:
                    const Text('Did you remember your password? Login here!'),
              )
            ],
          )),
    );
  }
}

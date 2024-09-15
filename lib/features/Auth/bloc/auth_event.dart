
part of 'auth_bloc.dart';

abstract class AuthEvent{}

class AuthSignIn extends AuthEvent{
  final String email, password;
  final String? role;
  final GlobalKey<FormState> signInFormKey;

  AuthSignIn({required this.email, required this.password, this.role, required this.signInFormKey});
}
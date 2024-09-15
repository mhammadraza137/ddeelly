
part of 'auth_bloc.dart';

abstract class AuthState{}

class AuthInitial extends AuthState{}

class AuthSignInLoading extends AuthState{}

class AuthSignInError extends AuthState{
  final String errorMsg;

  AuthSignInError({required this.errorMsg});
}
class AuthSignInNoInternet extends AuthState{
  final String errorMsg;

  AuthSignInNoInternet({required this.errorMsg});
}

class AuthSignInSuccess extends AuthState{}

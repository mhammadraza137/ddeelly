

import 'package:ddeelly/core/networkService/api_response.dart';
import 'package:ddeelly/features/Auth/repository/auth_repository.dart';
import 'package:ddeelly/utils/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final AuthRepository _authRepository = AuthRepository();
  AuthBloc() : super(AuthInitial()){
    on<AuthSignIn>((event, emit) async {
      emit(AuthSignInLoading());
        if(event.signInFormKey.currentState!.validate()){
        debugPrint("Form is validated");
        ApiResponse signInUserResponse = await _authRepository.signInUser(email: event.email, password: event.password);
        if(signInUserResponse.status == Status.success){
          emit(AuthSignInSuccess());
        } else if(signInUserResponse.status == Status.failure){
          emit(AuthSignInError(errorMsg: signInUserResponse.message ?? AppStrings.somethingWentWrong));
        } else if(signInUserResponse.status == Status.failure){
          emit(AuthSignInNoInternet(errorMsg: signInUserResponse.message ?? AppStrings.somethingWentWrong));
        }
      } else{
          emit(AuthSignInError(errorMsg: AppStrings.somethingWentWrong));
        }
    },);
  }
}
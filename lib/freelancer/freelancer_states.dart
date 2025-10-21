import 'package:firebase_auth/firebase_auth.dart';

abstract class FreelancerStates {}

class InitialState extends FreelancerStates {}

class AuthLoadingState extends FreelancerStates {}

class AuthSuccessState extends FreelancerStates {
  final User user;

  AuthSuccessState({required this.user});
}

class AuthErrorState extends FreelancerStates {
  final String errorMessage;

  AuthErrorState({required this.errorMessage});
}

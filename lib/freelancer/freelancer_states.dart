abstract class FreelancerStates {}

class InitialState extends FreelancerStates {}

class AuthLoadingState extends FreelancerStates {}

class AuthSuccessState extends FreelancerStates {
  final String email;

  AuthSuccessState({required this.email});
}

class AuthErrorState extends FreelancerStates {
  final String error;

  AuthErrorState({required this.error});
}

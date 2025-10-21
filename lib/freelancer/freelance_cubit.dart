import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/freelancer/auth/authfirebase_freelance.dart';
import 'package:first_app/freelancer/freelancer_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FreelanceCubit extends Cubit<FreelancerStates> {
  FreelanceCubit() : super(InitialState());

  loginMethod(String email, String password) async {
    emit(AuthLoadingState());
    try {
      var cred = await AuthFireBaseFreelance.login(email, password);
      emit(AuthSuccessState(user: cred.user!));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  signUp(String email, String password) async {
    emit(AuthLoadingState());
    try {
      var cred = await AuthFireBaseFreelance.signUp(email, password);
      emit(AuthSuccessState(user: cred.user!));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  isLoggedIn() async {
    await Future.delayed(Duration(milliseconds: 1500));
    if (FirebaseAuth.instance.currentUser != null) {
      emit(AuthSuccessState(user: FirebaseAuth.instance.currentUser!));
      return true;
    } else {
      return false;
    }
  }
}

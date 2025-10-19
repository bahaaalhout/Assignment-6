import 'package:first_app/freelancer/freelancer_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FreelanceCubit extends Cubit<FreelancerStates> {
  FreelanceCubit() : super(InitialState());

  loginMethod(String email, String password) async {
    emit(AuthLoadingState());
    await Future.delayed(Duration(seconds: 2));
    if (!email.contains('@') && !email.contains('.')) {
      emit(AuthErrorState(error: 'The Email is Invalid'));
      return;
    }
    emit(AuthSuccessState(email: email));
  }

  signUp(String email, String password) async {
    emit(AuthLoadingState());
    await Future.delayed(Duration(microseconds: 400));
    if (!email.contains('@') && !email.contains('.')) {
      emit(AuthErrorState(error: 'The Email is Invalid'));
      return;
    }
    emit(AuthSuccessState(email: email));
  }
}

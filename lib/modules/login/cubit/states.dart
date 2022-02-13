
abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  // LoginModel model ;
  // LoginSuccessState({this.model}) ;
}

class LoginErrorState extends LoginStates {}

class LoginLoadingState extends LoginStates {}



class ChangePasswordSecureState extends LoginStates {}

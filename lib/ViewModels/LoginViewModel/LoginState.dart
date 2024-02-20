
abstract class LoginStates{}
class loadingLoginState extends LoginStates{}
class FailedLoginState extends LoginStates{
  String errorMessage;
  FailedLoginState({required this.errorMessage});
}
class SuccessLoginState extends LoginStates{
  String succesMessage;
  SuccessLoginState({required this.succesMessage});
}
class InitialLoginState extends LoginStates{}
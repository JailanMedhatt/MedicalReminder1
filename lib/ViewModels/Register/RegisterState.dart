
abstract class RegisterStates{}
class loadingRegisterState extends RegisterStates{}
class FailedRegisterState extends RegisterStates{
  String errorMessage;
  FailedRegisterState({required this.errorMessage});
}
class SuccessRegisterState extends RegisterStates{
  String succesMessage;
  SuccessRegisterState({required this.succesMessage});
}
class InitialRegisterState extends RegisterStates{}
import 'package:finalproject1/FireBase/Models/MyUser.dart';

abstract class ProfileStates{}
class InitialProfileState extends ProfileStates{}
class LoadingProfileState extends ProfileStates{}
class LoadingUserAppointmentState extends ProfileStates{}

class LoadModalState extends ProfileStates{
  String? phoneNum;
  LoadModalState({required this.phoneNum});
}
class LoadedProfileState extends ProfileStates{
  MyUser user;
  LoadedProfileState({required this.user});
}
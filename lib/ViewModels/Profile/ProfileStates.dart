import 'package:finalproject1/FireBase/Models/MyUser.dart';

abstract class ProfileStates{}
class InitialProfileState extends ProfileStates{}
class LoadingProfileState extends ProfileStates{}
class LoadedProfileState extends ProfileStates{
  MyUser user;
  LoadedProfileState({required this.user});
}
import 'package:finalproject1/CustomWidgets/InfoContainer.dart';
import 'package:finalproject1/UI/profile/PhoneModalSheet.dart';
import 'package:finalproject1/ViewModels/Profile/ProfileStates.dart';
import 'package:finalproject1/ViewModels/Profile/ProfileViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  static final String routeName = "profile";

  ProfileViewModel viewModel= ProfileViewModel.getPorfileViewModel();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Container(   decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Opening.png"),
          fit: BoxFit.cover,
        ),
      )),
        SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
          resizeToAvoidBottomInset: false,
          body: BlocBuilder<ProfileViewModel,ProfileStates>(
            bloc: viewModel..LoadProfile(),


            builder: (context,state){
              if(state is LoadingProfileState){
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 200.h, horizontal: 50.h),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if(state is LoadedProfileState){
              return  SingleChildScrollView(
                child: Column(
                children: [
                  Container( margin: EdgeInsets.only(top: 10.h, bottom: 15.h),
                    decoration: BoxDecoration(
                      color: Color(0xd45d65b0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 310.h,
                    width: 345.w,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 220.w),
                            child: IconButton(onPressed: (){
                              showModalBottomSheet( enableDrag: true,
                                  isScrollControlled: true,
                                  constraints:BoxConstraints.tight(Size(MediaQuery.sizeOf(context).width,600.h)) ,
                                  context: context, builder:(context)=>PhoneModalSheet(phoneNum: state.user.phoneNumber??"" ,));

                            }, icon: Icon(Icons.edit,color: Colors.white, size: 40,)),
                          ),
                          Image.asset("assets/images/prof.png"),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            state.user.name??"",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text("Elder Care Made Simple with care zone",
                              style: TextStyle(color: Colors.white, fontSize: 17))
                        ],
                      ),
                    ),
                  ),

                  InfoContainer(imageIcon:"assets/images/email.png" , infoString: state.user.email??"",),
                  InfoContainer(imageIcon:"assets/images/call.png", infoString:state.user.phoneNumber??""),
                  InfoContainer(imageIcon: "assets/images/name.png", infoString: state.user.name??"",),
                  InfoContainer(imageIcon: "assets/images/email.png", infoString: state.user.partnerEmail??"",)
                 , SizedBox(
                    height: 20.h,
                  )
                ],
                            ),
              );}
              return Text("data");
              },

          ),
        ),
      ),
    ]);
  }


}
import 'package:finalproject1/CustomWidgets/ProfileTextFF.dart';
import 'package:finalproject1/DialogUtills.dart';
import 'package:finalproject1/FireBase/Models/MyUser.dart';
import 'package:finalproject1/ViewModels/Profile/ProfileStates.dart';
import 'package:finalproject1/ViewModels/Profile/ProfileViewModel.dart';
import 'package:finalproject1/myTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/list_provider.dart';

class PhoneModalSheet extends StatelessWidget {
  MyUser user;
  PhoneModalSheet({required this.user});

  @override
  ProfileViewModel viewModel = ProfileViewModel.getPorfileViewModel();

  Widget build(BuildContext context) {
    var myProvider = Provider.of<ListProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color:  myProvider.isDarkMode()?
        MyTheme.backgroundDark.withOpacity(0.8)
            :
        Colors.deepPurple.withOpacity(0.8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(27.0),
          topRight: Radius.circular(27.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
            child: Center(
              child: Text(
                "Edit",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          BlocListener<ProfileViewModel, ProfileStates>(
            bloc: viewModel,
            listener: (context, state) {},
            child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ProfileTextFF(
                    iconPath: "assets/images/call.png",
                    controller: viewModel.numE,
                    validator: viewModel.phoneNumValidator,
                  ),
                  ProfileTextFF(
                    iconPath: "assets/images/name.png",
                    controller: viewModel.nameE,
                    validator: viewModel.nameValidator,
                  ),
                  ProfileTextFF(
                    iconPath: "assets/images/email.png",
                    controller: viewModel.partnerE,
                    validator: viewModel.PartneremailValidator,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 40.h, horizontal: 60.w),
                    child: ElevatedButton(
                      onPressed: () {
                        DialogUtills.showMessage(
                            "Are you sure you want to edit your profile details?",
                            context,
                            posActionName: "yes",
                            posAction: () {
                              viewModel.EditDetails();
                              // Navigator.pop(context);
                            },
                            negActionName: "Cancel",
                            negAction: () {
                              // Navigator.popUntil(context, (route) => route.settings.name==Profile.routeName);
                            });
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF56279B),
                          padding: EdgeInsets.symmetric(vertical: 15.h)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

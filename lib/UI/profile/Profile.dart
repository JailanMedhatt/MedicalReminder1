
import 'package:finalproject1/CustomWidgets/InfoContainer.dart';
import 'package:finalproject1/UI/profile/PhoneModalSheet.dart';
import 'package:finalproject1/ViewModels/Profile/ProfileStates.dart';
import 'package:finalproject1/ViewModels/Profile/ProfileViewModel.dart';
import 'package:finalproject1/myTheme.dart';
import 'package:finalproject1/providers/list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile extends StatelessWidget {
  static final String routeName = "profile";

  ProfileViewModel viewModel = ProfileViewModel.getPorfileViewModel();

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: listProvider.getBackgroundImage(),
          ),
        ),
        Scaffold(
          backgroundColor: listProvider.isDarkMode()?
              Colors.transparent :
          Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          resizeToAvoidBottomInset: false,
          body: BlocBuilder<ProfileViewModel, ProfileStates>(
            bloc: viewModel..LoadProfile(),
            builder: (context, state) {
              if (state is LoadingProfileState) {
                return Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 200.h, horizontal: 50.h),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state is LoadedProfileState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              //color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                          decoration: BoxDecoration(
                              image:
                              DecorationImage(image:
                              listProvider.isDarkMode() ?
                              AssetImage("assets/images/y2dd.png")
                                  :
                              AssetImage("assets/images/y2pl.png")
                                  ,fit: BoxFit.fill),
                           // color: Colors.black
                              ),
                            // decoration: BoxDecoration(
                            //   color: listProvider.isDarkMode()
                            //       ? MyTheme.n.withOpacity(0.80)
                            //       : Color(0xd45d65b0),
                            //   borderRadius: BorderRadius.only(
                            //     bottomLeft: Radius.circular(24),
                            //     bottomRight: Radius.circular(10),
                            //   ),
                            // ),
                             height: 260.h,
                             width: 390.w,

                            child: Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/prof.png",
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: MediaQuery.of(context).size.width *
                                        0.2,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    state.user.name ?? "",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(AppLocalizations.of(context)!.word,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17))
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -10,
                            //bottom: -10,
                            right: 1,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor:
                              listProvider.isDarkMode() ?
                              Color(0xff2e63be):
                              Color(0xff9e67bd),
                              child: InkWell(
                                child: Icon(FontAwesomeIcons.angleDoubleUp,
                                    color: Colors.white),
                                onTap: (){
                                  showModalBottomSheet(
                                    enableDrag: true,
                                    isScrollControlled: true,
                                    constraints: BoxConstraints.tight(
                                        Size(
                                            MediaQuery.sizeOf(context)
                                                .width,
                                            600.h)),
                                    context: context,
                                    builder: (context) =>
                                        PhoneModalSheet(
                                          user: state.user,
                                        ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 37,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textObjects(
                              context,
                                'Email',
                                "assets/images/email.png",
                                state.user.email ?? "",
                                listProvider.isDarkMode() ? MyTheme.icondark : MyTheme.iconlight
                            ),
                            SizedBox(height: 19),
                            textObjects(
                              context,
                                'Phone Number',
                                "assets/images/call.png",
                                state.user.phoneNumber ?? "",
                                listProvider.isDarkMode() ? MyTheme.icondark : MyTheme.iconlight
                            ),
                            SizedBox(height: 19),
                            textObjects(
                                 context,
                                'Name',
                                "assets/images/name.png",
                                state.user.name ?? "",
                                listProvider.isDarkMode() ? MyTheme.icondark : MyTheme.iconlight
                            ),
                            SizedBox(height: 19),
                            textObjects(
                              context,
                                'Partner Email',
                                "assets/images/email.png",
                                state.user.partnerEmail ?? "",
                                listProvider.isDarkMode() ? MyTheme.icondark : MyTheme.iconlight
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Text("data");
            },
          ),
        ),
      ],
    );
  }

  Widget textObjects(BuildContext context,String title, String img, String text, Color iconColor) {
    var listProvider = Provider.of<ListProvider>(context);

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          color:  listProvider.isDarkMode() ?
          Color(0xff3d425d):
          Colors.white,
          boxShadow: [BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 3,
        offset: Offset(0, 5.0), // changes position of shadow
      ),]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  img,
                  height: 30.h,
                  width: 30.w,
                  color: iconColor,
                ),
                SizedBox(width: 15.w),
                Text(
                  text,
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/list_provider.dart';

class SecondScreenHelpAndSupport extends StatefulWidget {
  static const String routeName = 'Second_HelpScreen';
  const SecondScreenHelpAndSupport({super.key});

  @override
  State<SecondScreenHelpAndSupport> createState() =>
      _SecondScreenHelpAndSupportState();
}

class _SecondScreenHelpAndSupportState
    extends State<SecondScreenHelpAndSupport> {
  final Color color = const Color(0xff5D65B0);

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Stack(
      children: [
        Container(
          decoration:  BoxDecoration(
            image: listProvider.getBackgroundImage(),
          ),
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, size: 32)),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Help & Support',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 27.sp),
                  ),
                  // InkWell(
                  //   child: Image.asset("assets/images/search.png"),
                  //   onTap: () {},
                  // ),
                ],
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 170.h, left: 12.w, right: 9.w),
                  child: Text(
                    "To contact support you can also use the link bellow If you are experiencing errors within the app, please include screenshots or a screen recording of the behavior when submitting a support message. This will help our team to more quickly resolve or report the issue!\nThank you!",
                    style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    "CareZone@gmail.com",
                    style: TextStyle(
                        color: color,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

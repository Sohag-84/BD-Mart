import 'package:flutter/cupertino.dart';
import 'package:gym_swat/core/constants/exports.dart';

class AuthScreen {
  static Widget buildScreen(
      BuildContext context, String headerText, Widget child,
      {bool backButton = false, bool isBackButton = false}) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: isBackButton
            ? GestureDetector(
                child: const Icon(
                  CupertinoIcons.back,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            : Container(),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 3,
            width: MediaQuery.sizeOf(context).width,
            color: AppColors.blackColor,
            alignment: Alignment.topRight,
          ),
          CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Gap(40.h),
                    backButton
                        ? Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: const EdgeInsets.only(right: 18),
                              height: 30,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: AppColors.whiteColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            refreshIcon,
                            height: 45.h,
                          ),
                        ],
                      ),
                    ),
                    Gap(10.h),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15.0,
                        top: 0,
                      ),
                      child: Text(
                        headerText,
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: child,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

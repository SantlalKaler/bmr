import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../constants/dimens_constants.dart';
import '../elements/app_button.dart';
import '../routes/mobile_routes.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.black26,
        ),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SvgPicture.asset(ImageConstants.error404),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: DimensConstants.highSpacing),
                child: Row(
                  children: [
                    Expanded(
                      child: AppButton(
                          title: "Go Home",
                          onTap: () {
                            context.push(AppPath.splashPath);
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

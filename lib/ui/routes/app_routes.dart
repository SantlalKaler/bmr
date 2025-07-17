import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'mobile_routes.dart';

class MyRoutes {
  GoRouter getMyRoutes(BuildContext context) {
    return mobileRoutes;
    // return GetPlatform.isMobile ? mobileRoutes : desktopRoutes;
  }
}


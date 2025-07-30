import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/routes/mobile_routes.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Profile",
          )),
      body: Padding(
        padding: EdgeInsets.all(DimensConstants.screenPadding),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.lock_reset),
              title: Text("Change Password"),
              onTap: () {
                context.push(AppPath.changePassword);
              },
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text("Leave Request"),
              onTap: () {
                context.push(AppPath.leaveRequest);
              },
            )
          ],
        ),
      ),
    );
  }
}

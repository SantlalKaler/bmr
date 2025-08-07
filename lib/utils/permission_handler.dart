import 'package:permission_handler/permission_handler.dart';

import '../ui/constants/constant.dart';

Future<bool> isPermissionGranted(Permission permission) async {
  var permissionGranted = false;
  Constant.printValue("Permission denied ${await permission.status}");
  if (await permission.isDenied ||
      await permission.isPermanentlyDenied ||
      await permission.shouldShowRequestRationale ||
      await permission.isLimited ||
      await permission.isProvisional ||
      await permission.isRestricted) {
    final result = await permission.request();
    if (result.isGranted) {
      permissionGranted = true;
    } else if (result.isDenied) {
      permissionGranted = false;
    } else if (result.isPermanentlyDenied) {
      permissionGranted = false;
    }
  } else {
    permissionGranted = true;
  }
  return permissionGranted;
}

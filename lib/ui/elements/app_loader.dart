import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme_light.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key, this.color, this.info});
  final Color? color;
  final String? info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: color ?? primaryColor,
            strokeWidth: 3,
          ),
        ),
        if (info != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              info!,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
      ],
    );
  }
}

void watchLoadingDialog(RxBool loadingState, BuildContext context) {
  ever(loadingState, (bool loading) {
    if (loading && context.mounted && !Get.isDialogOpen!) {
      showLoadingDialog(context);
    } else {
      hideLoadingDialog(context);
    }
  });
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.2),
    builder: (_) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
}

void hideLoadingDialog(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  }
}

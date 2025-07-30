import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../constants/dimens_constants.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key, this.title, this.customTitle});

  final String? title;
  final Widget? customTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6F8FEF), Color(0xFF7DB2F6)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: DimensConstants.screenPadding),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          const Gap(16),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Stack(
              children: [
                // 3 horizontal lines
                Row(
                  children: [
                    for (var i = 1; i <= 3; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Container(
                          height: double.infinity,
                          width: 4,
                          color: Colors.white.withValues(alpha: 0.3),
                        ),
                      )
                  ],
                ),
                Positioned(
                    top: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (var i = 1; i <= 20; i++)
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Container(
                                  height: 4,
                                  width: 4,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(100),
                                      color:
                                          Colors.white.withValues(alpha: 0.3)),
                                ),
                              )
                          ],
                        ),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (var i = 1; i <= 20; i++)
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Container(
                                  height: 4,
                                  width: 4,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(100),
                                      color:
                                          Colors.white.withValues(alpha: 0.3)),
                                ),
                              )
                          ],
                        ),
                      ],
                    )),
                Positioned(
                        bottom: 10,
                        right: 0,
                        child: Text(title!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )))
              ],
            ),
          ),
          const Text(
            "",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

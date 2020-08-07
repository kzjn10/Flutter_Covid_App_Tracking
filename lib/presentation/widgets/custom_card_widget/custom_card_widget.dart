import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:corona_virus_app/presentation/theme/theme_color.dart';
import 'package:corona_virus_app/presentation/widgets/image_network_widget/image_network_widget.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  final BoxDecoration decoration;
  final String bgUrl;

  CustomCardWidget({this.child, this.decoration, this.bgUrl = ''});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
          decoration: decoration ?? getDefaultDecoration(),
          child: Stack(
            children: <Widget>[
              Positioned(
                right: -100.0,
                bottom: -40.0,
                width: 300,
                height: 200,
                child: Opacity(
                  opacity: .5,
                  child: ImageNetworkWidget(
                    imageUrl: bgUrl,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(30.w),
                child: child ?? Container(),
              ),
            ],
          )),
    );
  }

  BoxDecoration getDefaultDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColor.borderColor.withOpacity(.3)),
      color: AppColor.white,
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          spreadRadius: 1,
          color: AppColor.cardShadowColor.withOpacity(.1),
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:corona_virus_app/presentation/widgets/place_holder_widget/place_holder_widget.dart';

class LoadingInfoWidget extends StatelessWidget {
  final double titleWidth;
  final double titleHeight;
  final double valueWidth;
  final double valueHeight;

  LoadingInfoWidget({
    this.titleWidth = 20,
    this.titleHeight = 20,
    this.valueWidth = 20,
    this.valueHeight = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        PlaceHolderWidget(
          width: valueWidth,
          height: valueHeight,
          borderRadius: BorderRadius.circular(5),
        ),
        SizedBox(height: 15.h),
        PlaceHolderWidget(
          width: titleWidth,
          height: titleHeight,
          borderRadius: BorderRadius.circular(5),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:corona_virus_app/common/constants/graphic_constants.dart';
import 'package:corona_virus_app/common/internationalization.dart';
import 'package:corona_virus_app/presentation/theme/theme_color.dart';
import 'package:corona_virus_app/presentation/widgets/custom_card_widget/custom_card_widget.dart';
import 'package:corona_virus_app/presentation/widgets/image_network_widget/image_network_widget.dart';

class PreventionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final i18n = S.of(context);
    return CustomCardWidget(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 30.h,
                  width: 7.w,
                  decoration: BoxDecoration(
                    color: AppColor.downy,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(width: 20.w),
                Text(
                  i18n.translate('homeScreen.title.preventions').toUpperCase(),
                  style: Theme.of(context).textTheme.button.copyWith(
                        fontSize: 17,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            ImageNetworkWidget(
              imageUrl: GraphicConstants.preventionBanner,
              width: _screenWidth,
              height: _screenWidth * .6,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
      ),
    );
  }
}

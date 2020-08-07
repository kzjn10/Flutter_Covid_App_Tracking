import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:corona_virus_app/common/constants/graphic_constants.dart';
import 'package:corona_virus_app/common/internationalization.dart';
import 'package:corona_virus_app/presentation/theme/theme_color.dart';
import 'package:corona_virus_app/presentation/widgets/custom_card_widget/custom_card_widget.dart';
import 'package:corona_virus_app/presentation/widgets/image_network_widget/image_network_widget.dart';

class ConclusionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final i18n = S.of(context);
    return CustomCardWidget(
      child: Container(
        child: Column(
          children: <Widget>[
            ImageNetworkWidget(
              width: double.infinity,
              imageUrl: GraphicConstants.conclusionBanner,
              height: 200,
            ),
            SizedBox(height: 20.h),
            Text(
              i18n.translate('homeScreen.message.conclusion'),
              style: Theme.of(context).textTheme.headline3.copyWith(
                    fontSize: 20,
                    color: AppColor.chartPurple,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

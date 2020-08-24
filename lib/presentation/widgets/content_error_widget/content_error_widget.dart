import 'package:flutter/material.dart';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:corona_virus_app/common/internationalization.dart';
import 'package:corona_virus_app/presentation/theme/theme_color.dart';
import 'package:corona_virus_app/common/constants/graphic_constants.dart';

class ContentErrorWidget extends StatelessWidget {
  final bool isConnectionError;

  ContentErrorWidget({this.isConnectionError = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          child: const FlareActor(
            GraphicConstants.coronaVirus,
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: AnimationConstants.roaming,
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          isConnectionError
              ? S.of(context).translate('common.message.connectionError')
              : S.of(context).translate('common.message.UnknownError'),
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
        ),
      ],
    );
  }
}

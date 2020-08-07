import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:corona_virus_app/presentation/theme/theme_color.dart';
import 'package:corona_virus_app/domain/entities/report_entity.dart';
import 'package:corona_virus_app/common/extensions/number_extensions.dart';

class CountryItemWidget extends StatelessWidget {
  final ReportEntity data;

  CountryItemWidget({@required this.data});

  @override
  Widget build(BuildContext context) {
    var recoveredInfo = '';
    if (data?.recovered == null) {
      recoveredInfo = 'N/A';
    } else {
      recoveredInfo = data.recovered.toFormattedValue();
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(
              data?.country ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.button.copyWith(
                    fontSize: 14,
                    color: AppColor.primaryColor,
                  ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              '${(data?.cases ?? 0).toFormattedValue()}',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.button.copyWith(
                    fontSize: 14,
                    color: AppColor.primaryColor,
                  ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              recoveredInfo,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.button.copyWith(
                    fontSize: 14,
                    color: AppColor.chartGreen,
                  ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${(data.deaths ?? 0).toFormattedValue()}',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.button.copyWith(
                    fontSize: 14,
                    color: AppColor.highlightColor,
                  ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:corona_virus_app/common/injector/injector.dart';
import 'package:corona_virus_app/common/internationalization.dart';
import 'package:corona_virus_app/domain/entities/report_entity.dart';
import 'package:corona_virus_app/presentation/theme/theme_color.dart';
import 'package:corona_virus_app/common/constants/graphic_constants.dart';
import 'package:corona_virus_app/common/extensions/number_extensions.dart';
import 'package:corona_virus_app/presentation/widgets/info_widget/info_widget.dart';
import 'package:corona_virus_app/presentation/common_bloc/corona_bloc/corona_bloc.dart';
import 'package:corona_virus_app/presentation/widgets/custom_card_widget/custom_card_widget.dart';
import 'package:corona_virus_app/presentation/widgets/loading_info_widget/loading_info_widget.dart';
import 'package:corona_virus_app/presentation/widgets/content_error_widget/content_error_widget.dart';

class CountryInfoWidget extends StatefulWidget {
  @override
  _CountryInfoWidgetState createState() => _CountryInfoWidgetState();
}

class _CountryInfoWidgetState extends State<CountryInfoWidget> {
  CoronaBloc _coronaBloc;

  @override
  void initState() {
    super.initState();
    if (!mounted) {
      return;
    }

    _coronaBloc = Injector.resolve<CoronaBloc>();
  }

  @override
  void dispose() {
    _coronaBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      bgUrl: GraphicConstants.graphic1,
      child: BlocBuilder<CoronaBloc, CoronaState>(
        bloc: _coronaBloc..add(FetchCountryReportEvent()),
        builder: (context, state) {
          if (state is FetchCountryReportState) {
            return _buildLoadingContentWidget(context);
          } else if (state is FailToLoadCountryReportState) {
            return _buildFailContentWidget(context);
          } else if (state is LoadedCountryReportState) {
            return _buildContentWidget(context, state.data);
          } else if (state is NetworkExceptionState) {
            return _buildFailContentWidget(context, isConnectionError: true);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildFailContentWidget(BuildContext context,
      {bool isConnectionError = false}) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: InkWell(
        onTap: () {
          _coronaBloc?.add(FetchSummaryEvent());
        },
        child: Center(child: ContentErrorWidget()),
      ),
    );
  }

  Widget _buildContentWidget(BuildContext context, ReportEntity data) {
    final i18n = S.of(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                i18n.translate('homeScreen.title.vietnam').toUpperCase(),
                style: Theme.of(context).textTheme.button.copyWith(
                      fontSize: 17,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Row(
            children: <Widget>[
              Expanded(
                child: InfoWidget(
                  title: i18n.translate('homeScreen.headline.newCases'),
                  value: '${data.todayCases.toFormattedValue()}',
                  valueColor: AppColor.carnation,
                ),
              ),
              Expanded(
                child: InfoWidget(
                  title: i18n.translate('homeScreen.headline.newDeaths'),
                  value: '${data.todayDeaths.toFormattedValue()}',
                  valueColor: AppColor.highlightColor,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            width: 150,
            height: .5,
            color: AppColor.primaryColor.withOpacity(.5),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: InfoWidget.extend(
                  title: i18n.translate('homeScreen.headline.case'),
                  value: '${data.cases.toFormattedValue()}',
                  valueColor: AppColor.carnation,
                ),
              ),
              Expanded(
                child: InfoWidget.extend(
                  title: i18n.translate('homeScreen.headline.totalRecoveries'),
                  value: '${data.recovered.toFormattedValue()}',
                  valueColor: AppColor.chartGreen,
                ),
              ),
              Expanded(
                child: InfoWidget.extend(
                  title: i18n.translate('homeScreen.headline.active'),
                  value: '${data.active.toFormattedValue()}',
                  valueColor: AppColor.chartBlue,
                ),
              ),
              Expanded(
                child: InfoWidget.extend(
                  title: i18n.translate('homeScreen.headline.totalDeaths'),
                  value: '${data.deaths.toFormattedValue()}',
                  valueColor: AppColor.highlightColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _buildLoadingContentWidget(BuildContext context) {
    final i18n = S.of(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                i18n.translate('homeScreen.title.vietnam').toUpperCase(),
                style: Theme.of(context).textTheme.button.copyWith(
                      fontSize: 17,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Row(
            children: <Widget>[
              Expanded(
                child: LoadingInfoWidget(
                  titleWidth: 120,
                  valueHeight: 30,
                  valueWidth: 50,
                ),
              ),
              Expanded(
                child: LoadingInfoWidget(
                  titleWidth: 120,
                  valueHeight: 30,
                  valueWidth: 50,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            width: 150,
            height: .5,
            color: AppColor.primaryColor.withOpacity(.5),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: LoadingInfoWidget(
                  titleWidth: 70,
                  valueHeight: 25,
                  valueWidth: 40,
                ),
              ),
              Expanded(
                child: LoadingInfoWidget(
                  titleWidth: 70,
                  valueHeight: 25,
                  valueWidth: 40,
                ),
              ),
              Expanded(
                child: LoadingInfoWidget(
                  titleWidth: 70,
                  valueHeight: 25,
                  valueWidth: 40,
                ),
              ),
              Expanded(
                child: LoadingInfoWidget(
                  titleWidth: 70,
                  valueHeight: 25,
                  valueWidth: 40,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}

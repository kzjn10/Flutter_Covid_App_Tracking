import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:corona_virus_app/common/injector/injector.dart';
import 'package:corona_virus_app/common/internationalization.dart';
import 'package:corona_virus_app/domain/entities/report_entity.dart';
import 'package:corona_virus_app/presentation/theme/theme_color.dart';
import 'package:corona_virus_app/common/constants/graphic_constants.dart';
import 'package:corona_virus_app/common/extensions/number_extensions.dart';
import 'package:corona_virus_app/common/extensions/date_time_extensions.dart';
import 'package:corona_virus_app/presentation/widgets/info_widget/info_widget.dart';
import 'package:corona_virus_app/presentation/common_bloc/corona_bloc/corona_bloc.dart';
import 'package:corona_virus_app/presentation/widgets/indicator_widget/indicator_widget.dart';
import 'package:corona_virus_app/presentation/widgets/custom_card_widget/custom_card_widget.dart';
import 'package:corona_virus_app/presentation/widgets/loading_info_widget/loading_info_widget.dart';
import 'package:corona_virus_app/presentation/widgets/content_error_widget/content_error_widget.dart';

class SummaryWidget extends StatefulWidget {
  @override
  _SummaryWidgetState createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  ValueNotifier<int> _touchIndexNotifier;
  CoronaBloc _coronaBloc;

  @override
  void initState() {
    super.initState();
    if (!mounted) {
      return;
    }

    _coronaBloc = Injector.resolve<CoronaBloc>();
    _touchIndexNotifier = ValueNotifier(-1);
  }

  @override
  void dispose() {
    _coronaBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      bgUrl: GraphicConstants.graphic2,
      child: BlocBuilder<CoronaBloc, CoronaState>(
        bloc: _coronaBloc..add(FetchSummaryEvent()),
        builder: (context, state) {
          if (state is FetchSummaryState) {
            return _buildLoadingContentWidget(context);
          } else if (state is FailToLoadSummaryState) {
            return _buildFailContentWidget(context);
          } else if (state is LoadedSummaryState) {
            return _buildContentWidget(context, state.summary);
          } else if (state is NetworkExceptionState) {
            return _buildFailContentWidget(context, isConnectionError: true);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildContentWidget(BuildContext context, ReportEntity data) {
    final i18n = S.of(context);
    final lastUpdate =
        DateTime.fromMillisecondsSinceEpoch(data.updated).toStringFormat();

    return Column(
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
              i18n.translate('homeScreen.title.global').toUpperCase(),
              style: Theme.of(context).textTheme.button.copyWith(
                    fontSize: 17,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        _buildOverviewInfoWidget(context, data),
        _buildPieChartWidget(context, data),
        SizedBox(height: 30.h),
        Text(
          i18n.translate(
            'homeScreen.message.updatedTime',
            params: ['$lastUpdate'],
          ),
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: AppColor.blackOpacity5),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }

  Widget _buildLoadingContentWidget(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: _buildLoadingOverviewInfoWidget(),
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

  Widget _buildPieChartWidget(BuildContext context, ReportEntity data) {
    final i18n = S.of(context);
    return AnimatedBuilder(
      animation: _touchIndexNotifier,
      builder: (_, __) {
        return AspectRatio(
          aspectRatio: 1.7,
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                          pieTouchData:
                              PieTouchData(touchCallback: (pieTouchResponse) {
                            if (pieTouchResponse.touchInput is FlLongPressEnd ||
                                pieTouchResponse.touchInput is FlPanEnd) {
                              _touchIndexNotifier.value = -1;
                            } else {
                              _touchIndexNotifier.value =
                                  pieTouchResponse.touchedSectionIndex;
                            }
                          }),
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 0,
                          centerSpaceRadius: 35,
                          sections: showingSections(data)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Indicator(
                          color: AppColor.primaryColor,
                          text: i18n
                              .translate('homeScreen.headline.totalInfected'),
                        ),
                        SizedBox(height: 10.h),
                        Indicator(
                          color: AppColor.chartGreen,
                          text: i18n
                              .translate('homeScreen.headline.totalRecoveries'),
                        ),
                        SizedBox(height: 10.h),
                        Indicator(
                          color: AppColor.highlightColor,
                          text:
                              i18n.translate('homeScreen.headline.totalDeaths'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<PieChartSectionData> showingSections(ReportEntity data) {
    final currentInfectedPercent = data.getCurrentInfectedPercent();
    final currentRecoveriesPercent = data.getRecoveriesPercent();
    final currentDeathPercent = data.getDeathPercent();
    return List.generate(3, (i) {
      final isTouched = i == _touchIndexNotifier.value;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColor.primaryColor,
            value: currentInfectedPercent,
            title: '${currentInfectedPercent.toStringAsFixed(1)}%',
            radius: radius,
            titleStyle:
                TextStyle(fontSize: fontSize, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: AppColor.chartGreen,
            value: currentRecoveriesPercent,
            title: '${currentRecoveriesPercent.toStringAsFixed(1)}%',
            radius: radius,
            titleStyle:
                TextStyle(fontSize: fontSize, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: AppColor.cardinal,
            value: currentDeathPercent,
            title: '${currentDeathPercent.toStringAsFixed(1)}%',
            radius: radius,
            titleStyle:
                TextStyle(fontSize: fontSize, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }

  Widget _buildOverviewInfoWidget(BuildContext context, ReportEntity data) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InfoWidget(
            title: 'homeScreen.headline.totalConfirmed',
            value: '${data.cases.toFormattedValue()}',
            maxFontSize: 50,
            valueColor: AppColor.carnation,
          ),
          SizedBox(height: 20.h),
          Row(
            children: <Widget>[
              Expanded(
                child: InfoWidget(
                  title: 'homeScreen.headline.totalDeaths',
                  value: '${data.deaths.toFormattedValue()}',
                  valueColor: AppColor.highlightColor,
                ),
              ),
              Expanded(
                child: InfoWidget(
                  title: 'homeScreen.headline.totalRecoveries',
                  value: '${data.recovered.toFormattedValue()}',
                  valueColor: AppColor.chartGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingOverviewInfoWidget() {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LoadingInfoWidget(
            valueHeight: 60,
            valueWidth: screenWidth * .8,
            titleWidth: screenWidth * .6,
          ),
          SizedBox(height: 30.h),
          Row(
            children: <Widget>[
              Expanded(
                  child: LoadingInfoWidget(
                valueWidth: screenWidth * .35,
                titleWidth: screenWidth * .3,
              )),
              Expanded(
                  child: LoadingInfoWidget(
                valueWidth: screenWidth * .4,
                titleWidth: screenWidth * .25,
              )),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:corona_virus_app/common/injector/injector.dart';
import 'package:corona_virus_app/common/internationalization.dart';
import 'package:corona_virus_app/domain/entities/report_entity.dart';
import 'package:corona_virus_app/presentation/theme/theme_color.dart';
import 'package:corona_virus_app/presentation/common_bloc/corona_bloc/corona_bloc.dart';
import 'package:corona_virus_app/presentation/widgets/custom_card_widget/custom_card_widget.dart';
import 'package:corona_virus_app/presentation/widgets/place_holder_widget/place_holder_widget.dart';
import 'package:corona_virus_app/presentation/widgets/country_item_widget/country_item_widget.dart';
import 'package:corona_virus_app/presentation/widgets/content_error_widget/content_error_widget.dart';

class TopCountryWidget extends StatefulWidget {
  @override
  _TopCountryWidgetState createState() => _TopCountryWidgetState();
}

class _TopCountryWidgetState extends State<TopCountryWidget> {
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
      child: BlocBuilder<CoronaBloc, CoronaState>(
        bloc: _coronaBloc..add(FetchReportEvent()),
        builder: (context, state) {
          if (state is FetchReportState) {
            return _buildLoadingContentWidget(context);
          } else if (state is FailToLoadReportState) {
            return _buildFailContentWidget(context);
          } else if (state is LoadedReportState) {
            return _buildContentWidget(context, state.data);
          } else if (state is NetworkExceptionState) {
            return _buildFailContentWidget(context, isConnectionError: true);
          }
          return Container(
            child: Text('${state.toString()}'),
          );
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
        child: Center(
          child: ContentErrorWidget(isConnectionError: isConnectionError),
        ),
      ),
    );
  }

  Widget _buildContentWidget(BuildContext context, List<ReportEntity> data) {
    final i18n = S.of(context);
    final List<Widget> items =
        data.map((element) => CountryItemWidget(data: element)).toList();

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                i18n.translate('homeScreen.title.topCountry').toUpperCase(),
                style: Theme.of(context).textTheme.button.copyWith(
                      fontSize: 17,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          _buildHeaderWidget(context),
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: items,
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderWidget(BuildContext context) {
    final i18n = S.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      width: double.infinity,
      color: AppColor.primaryColor.withOpacity(.1),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: AutoSizeText(
              i18n.translate('homeScreen.title.country'),
              maxFontSize: 15,
              minFontSize: 12,
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
            child: AutoSizeText(
              i18n.translate('homeScreen.headline.totalConfirmed'),
              maxFontSize: 15,
              minFontSize: 12,
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
            child: AutoSizeText(
              i18n.translate('homeScreen.headline.totalRecoveries'),
              maxFontSize: 15,
              minFontSize: 12,
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
            child: AutoSizeText(
              i18n.translate('homeScreen.headline.totalDeaths'),
              maxFontSize: 15,
              minFontSize: 12,
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

  Widget _buildLoadingContentWidget(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildHeaderWidget(context),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: PlaceHolderWidget(
                  borderRadius: BorderRadius.circular(5),
                  width: double.infinity,
                  height: 40.h,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

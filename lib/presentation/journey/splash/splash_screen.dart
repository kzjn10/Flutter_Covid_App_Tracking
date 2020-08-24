import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'package:corona_virus_app/common/constants/router_constants.dart';
import 'package:corona_virus_app/common/injector/injector.dart';
import 'package:corona_virus_app/common/internationalization.dart';
import 'package:corona_virus_app/presentation/common_bloc/timer_bloc/timer_bloc.dart';
import 'package:corona_virus_app/presentation/journey/base/base_state_widget.dart';
import 'package:corona_virus_app/presentation/theme/theme_color.dart';
import 'package:corona_virus_app/common/constants/graphic_constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseStateWidget<SplashScreen> {
  TimerBloc _timerBloc;

  @override
  void initState() {
    super.initState();
    if (!mounted) {
      return;
    }

    _timerBloc = Injector.resolve<TimerBloc>()
      ..add(const TimerStarted(duration: 3));
  }

  @override
  void dispose() {
    _timerBloc.close();
    super.dispose();
  }

  @override
  Widget buildContentView(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: AppColor.splashBackgroundColor,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, bottom: 150),
            child: FlareActor(
              GraphicConstants.coronaVirus,
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: AnimationConstants.roaming,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(GraphicConstants.splashBackground),
          ),
          Center(
            child: BlocListener<TimerBloc, TimerState>(
              bloc: _timerBloc,
              listener: (context, state) {
                if (state is TimerRunComplete) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteName.homeScreen,
                    ModalRoute.withName(RouteName.initial),
                  );
                }
              },
              child: BlocBuilder<TimerBloc, TimerState>(
                bloc: _timerBloc,
                builder: (context, state) {
                  return Column(
                    children: <Widget>[
                      Expanded(child: Container()),
                      Text(
                        S
                            .of(context)
                            .translate('splashScreen.message.delayTime'),
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: AppColor.white,
                              fontSize: 16,
                            ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

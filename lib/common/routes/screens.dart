import 'package:appbloc_02/common/routes/names.dart';
import 'package:appbloc_02/global.dart';
import 'package:appbloc_02/screens/application/application_screen.dart';
import 'package:appbloc_02/screens/application/bloc/application_bloc.dart';
import 'package:appbloc_02/screens/sign_in/bloc/signin_bloc.dart';
import 'package:appbloc_02/screens/sign_in/sign_in.dart';
import 'package:appbloc_02/screens/sign_up/bloc/sign_up_bloc.dart';
import 'package:appbloc_02/screens/sign_up/sign_up.dart';
import 'package:appbloc_02/screens/welcome/bloc/welcome_bloc.dart';
import 'package:appbloc_02/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageEntity {
  String? route;
  Widget page;
  dynamic bloc;
  PageEntity({this.route, required this.page, this.bloc});
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const SignUp(),
        bloc: BlocProvider(
          create: (_) => SignUpBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const AplicationScreen(),
        bloc: BlocProvider(
          create: (_) => ApplicationBloc(),
        ),
      )
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      if (bloc.bloc != null) {
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLogged = Global.storageService.getIsLoggedIn();
          if (isLogged) {
            return MaterialPageRoute(
                builder: (_) => const AplicationScreen(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}
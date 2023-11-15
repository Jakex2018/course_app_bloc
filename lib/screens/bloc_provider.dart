import 'package:appbloc_02/screens/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appbloc_02/screens/sign_in/bloc/signin_bloc.dart';
import 'package:appbloc_02/screens/welcome/bloc/welcome_bloc.dart';

class AppProvider {
  // ignore: non_constant_identifier_names
  static get AllProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(create: (context) => SignUpBloc(),)
      ];
}

/*
/*
buildscript {
    ext.kotlin_version = '1.7.10'
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:7.3.0'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
        classpath 'com.google.gms:google-services:4.3.15'  
        /*classpath 'com.google.gms:google-services: 4.4.0'*/
    }
}
*/


 */

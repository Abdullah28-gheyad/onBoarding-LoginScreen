import 'package:advancedcourse/modules/onboard/cubit/cubit.dart';
import 'package:advancedcourse/modules/splash/splash_screen.dart';
import 'package:advancedcourse/shared/bloc/bloc_observer.dart';
import 'package:advancedcourse/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';

void main() {
  FlutterServicesBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () {
          DioHelper.init() ;
          runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

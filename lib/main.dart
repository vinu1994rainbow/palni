import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_new/ui/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubit_bloc/home_cubit/home_cubit.dart';

import 'di/locator.dart';
late SharedPreferences prefs;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await init();
  runApp(const MyApp());
}

Future init() async {
  prefs = await SharedPreferences.getInstance();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<HomeCubit>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const Splash(),
        ));
  }
}



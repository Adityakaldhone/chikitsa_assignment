
import 'package:chikitsa_assign/presentation/resources/router/route_manager.dart';
import 'package:chikitsa_assign/presentation/resources/theme/theme_manager.dart';
import 'package:chikitsa_assign/presentation/screens/home/bloc.dart';
import 'package:chikitsa_assign/presentation/screens/home/event.dart' as home;
import 'package:chikitsa_assign/presentation/screens/sign_in/bloc.dart';
import 'package:chikitsa_assign/presentation/screens/sign_in/event.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SignInBloc()..add(InitEvent())),
        BlocProvider(create: (_) => HomeBloc()..add(home.InitEvent())),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.homePage,
        theme: getApplicationTheme(),
      ),
    );
  }
}

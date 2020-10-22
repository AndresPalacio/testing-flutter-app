import 'package:flutter/material.dart';
import 'package:flutter_app_testing_dojo/bloc/account.dart';
import 'package:flutter_app_testing_dojo/screen/five.dart';
import 'package:flutter_app_testing_dojo/screen/third.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          home: MyHome(),
        );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MultiProvider(
          providers: [ChangeNotifierProvider.value(value: AccountBloc(page: 1))],
          child: MaterialApp(
            initialRoute: '/',
            routes: {
              '/': (context)=>ThirdScreen(),
            },
          ),
      );
  }
}

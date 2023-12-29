import 'package:flutter/material.dart';
import 'package:mvvm_basic/utils/routes/routes.dart';
import 'package:mvvm_basic/utils/routes/routes_name.dart';
import 'package:mvvm_basic/view/login_view.dart';
import 'package:mvvm_basic/view_model/auth_view_model.dart';
import 'package:mvvm_basic/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserViewModel(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
          debugShowCheckedModeBanner: false,
        ));
  }
}

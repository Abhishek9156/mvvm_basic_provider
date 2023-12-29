import 'package:flutter/material.dart';
import 'package:mvvm_basic/utils/routes/routes_name.dart';
import 'package:mvvm_basic/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPrefrence = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          onTap: () {
            userPrefrence.remove().then((value) {
              Navigator.pushNamed(context, RoutesName.login);
            });
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}

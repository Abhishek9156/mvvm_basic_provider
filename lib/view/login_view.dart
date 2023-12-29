import 'package:flutter/material.dart';
import 'package:mvvm_basic/res/components/round_button.dart';
import 'package:mvvm_basic/utils/routes/routes_name.dart';
import 'package:mvvm_basic/utils/utils.dart';
import 'package:mvvm_basic/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> obsecure = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final authviewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email_outlined)),
              onFieldSubmitted: (val) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
              valueListenable: obsecure,
              builder: (context, value, child) => TextFormField(
                controller: passwordController,
                obscureText: obsecure.value,
                focusNode: passwordFocusNode,
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                        onTap: () {
                          obsecure.value = !obsecure.value;
                        },
                        child: Icon(obsecure.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined))),
              ),
            ),
            SizedBox(height: height * .085),
            RoundButton(
                title: "Login",
                loading: authviewModel.loading,
                onpress: () {
                  if (emailController.text.toString().isEmpty) {
                    Utils.flushBarErrorMessage("please enter email", context);
                  } else if (passwordController.text.toString().isEmpty) {
                    Utils.flushBarErrorMessage(
                        "please enter password", context);
                  } else if (passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        "please enter 6 digit password", context);
                  } else {
                    Map data = {
                      //emailController.text.toString()
                      "email": "eve.holt@reqres.in",
                      "password": "cityslicka",
                    };
                    authviewModel.loginApi(data, context);
                  }
                }),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.signup);
                },
                child: Text("Don't hava an account? Sign up"))
          ],
        )));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    obsecure.dispose();
  }
}

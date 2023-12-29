import 'package:flutter/material.dart';
import 'package:mvvm_basic/res/components/round_button.dart';
import 'package:mvvm_basic/utils/routes/routes_name.dart';
import 'package:mvvm_basic/utils/utils.dart';
import 'package:mvvm_basic/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> obsecure = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final authviewModel=Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Sign Up",
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
                    title: "Sign up",
                    loading: authviewModel.signuploading,
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
                        Map data={
                          //emailController.text.toString()
                          "email":"eve.holt@reqres.in",
                          "password":"pistol",
                        };
                        authviewModel.signupApi(data,context);
                      }
                    }),
                SizedBox(height: height*0.02,),
                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RoutesName.login);
                    },
                    child: Text("Already hava an account? Login"))
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

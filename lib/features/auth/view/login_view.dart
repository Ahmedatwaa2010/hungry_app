import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constant/app_color.dart';
import 'package:hungry_app/core/constant/strings.dart';
import 'package:hungry_app/core/network/api_erorr.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/view/signup_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_btn.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/shared/custom_snack.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  AuthRepo authRepo = AuthRepo();
  bool isLoading = false;

  Future<void> login() async {
    if (_key.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      try {
        final user = await authRepo.login(
          emailController.text,
          passwordController.text,
        );
        setState(() {
          isLoading = false;
        });
        if (user != null) {
          Navigator.pushReplacementNamed(context, rootRouter);
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        String message = "unhandeled erorr in login ";
        if (e is ApiErorr) {
          message = e.message;
        }
        ScaffoldMessenger.of(context).showSnackBar(customSnack(message));
        setState(() {
          isLoading = false;
        });
      }
    } else {
      return;
    }
  }

  @override
  void initState() {
    emailController.text = "Venom@gmail.com";
    passwordController.text = "123456789";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Column(
                    children: [
                      Gap(100),
                      SvgPicture.asset(
                        'assets/logo/logo.svg',
                        color: PrimaryColors.primaryColor,
                      ),
                      Gap(10),
                      CustomText(
                        text: "Welcome to best food app",
                        color: PrimaryColors.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Gap(70),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: PrimaryColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Gap(50),
                              CustomTextfield(
                                obscureText: false,
                                hintText: "Email",
                                controller: emailController,
                              ),
                              Gap(40),
                              CustomTextfield(
                                obscureText: true,
                                hintText: "Password",
                                controller: passwordController,
                              ),
                              Gap(30),

                              isLoading
                                  ? CupertinoActivityIndicator.partiallyRevealed(
                                      color: Colors.white,
                                    )
                                  : CustomAuthBtn(
                                      text: "Login",
                                      onTap: () {
                                        login();
                                      },
                                    ),
                              Gap(50),
                              Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      signupRouter,
                                    );
                                  },
                                  child: CustomText(
                                    text: "Signup ?",
                                    fontSize: 20,
                                    color: PrimaryColors.primaryColor,
                                  ),
                                ),
                              ),
                              Gap(50),

                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    rootRouter,
                                  );
                                },
                                child: CustomText(
                                  text: "Continue as a geust ?",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

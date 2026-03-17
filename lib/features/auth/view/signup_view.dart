import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constant/app_color.dart';
import 'package:hungry_app/core/network/api_erorr.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/view/login_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_btn.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/shared/custom_snack.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isLoading = false;

  AuthRepo authRepo = AuthRepo();

  Future<void> signup() async {
    if (_key.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      try {
        final user = await authRepo.signup(
          namecontroller.text,
          emailController.text,
          passwordController.text,
          phoneController.text,
        );
        setState(() {
          isLoading = false;
        });
        if (user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Root();
              },
            ),
          );
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: Center(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Gap(100),
                  SizedBox(
                    height: 120,
                    child: Column(
                      children: [
                        Gap(32),
                        SvgPicture.asset(
                          'assets/logo/logo.svg',
                          color: PrimaryColors.primaryColor,
                        ),

                        CustomText(text: "Welcome to our Food APP"),
                      ],
                    ),
                  ),

                  Gap(70),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: PrimaryColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
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
                                hintText: "name",
                                controller: namecontroller,
                              ),
                              Gap(30),
                              CustomTextfield(
                                obscureText: false,
                                hintText: "email",
                                controller: emailController,
                              ),
                              Gap(30),
                              CustomTextfield(
                                obscureText: true,
                                hintText: "password",
                                controller: passwordController,
                              ),
                              Gap(30),
                              CustomTextfield(
                                obscureText: false,
                                hintText: "phone",
                                controller: phoneController,
                              ),
                              Gap(30),
                              isLoading
                                  ? CupertinoActivityIndicator.partiallyRevealed(
                                      color: Colors.white,
                                    )
                                  : CustomAuthBtn(
                                      text: "Sign Up",
                                      onTap: () {
                                        signup();
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
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (n) {
                                          return LoginView();
                                        },
                                      ),
                                    );
                                  },
                                  child: CustomText(
                                    text: "Login",
                                    fontSize: 20,
                                    color: PrimaryColors.primaryColor,
                                  ),
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

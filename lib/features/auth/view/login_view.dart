import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constant/app_color.dart';
import 'package:hungry_app/core/constant/strings.dart';
import 'package:hungry_app/features/auth/cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/widgets/custom_btn.dart';
import 'package:hungry_app/shared/custom_snack.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void login() {
    if (_key.currentState!.validate()) {
      context.read<AuthCubit>().login(
        emailController.text,
        passwordController.text,
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                      const Gap(100),
                      SvgPicture.asset(
                        'assets/logo/logo.svg',
                        color: PrimaryColors.primaryColor,
                      ),
                      const Gap(10),
                      CustomText(
                        text: "Welcome to best food app",
                        color: PrimaryColors.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  const Gap(70),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: PrimaryColors.primaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Gap(50),

                              CustomTextfield(
                                obscureText: false,
                                hintText: "Email",
                                controller: emailController,
                              ),

                              const Gap(40),

                              CustomTextfield(
                                obscureText: true,
                                hintText: "Password",
                                controller: passwordController,
                              ),

                              const Gap(30),

                              /// 🔥 Cubit UI
                              BlocConsumer<AuthCubit, AuthState>(
                                listener: (context, state) {
                                  if (state.isSuccsed) {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      rootRouter,
                                    );
                                  } else if (state.error != null) {
                                    ScaffoldMessenger.of(
                                      context,
                                    ).showSnackBar(customSnack(state.error!));
                                  }
                                },
                                builder: (context, state) {
                                  if (state.isLoading) {
                                    return const CupertinoActivityIndicator(
                                      color: Colors.white,
                                    );
                                  }

                                  return CustomAuthBtn(
                                    text: "Login",
                                    onTap: login,
                                  );
                                },
                              ),

                              const Gap(50),

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
                              const Gap(50),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    rootRouter,
                                  );
                                },
                                child: const CustomText(
                                  text: "Continue as a guest ?",
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

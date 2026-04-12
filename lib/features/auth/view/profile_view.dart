// ignore_for_file: unused_local_variable
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constant/app_color.dart';
import 'package:hungry_app/core/constant/strings.dart';
import 'package:hungry_app/core/network/api_erorr.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/data/user_model.dart';
import 'package:hungry_app/features/auth/widgets/custom_profile_textfield.dart';
import 'package:hungry_app/features/auth/widgets/profile_btn.dart';
import 'package:hungry_app/features/check_out/widgets/check_out_widget.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_snack.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _visacontroller = TextEditingController();
  final TextEditingController _deliverycontroller = TextEditingController();

  bool isLoading = true;
  bool isGuest = false;
  bool isUpdatingImage = false;

  UserModel? userModel;
  AuthRepo authRepo = AuthRepo();

  String? networkImage;
  XFile? selectedImage;

  /// Auto login
  Future<void> autoLogin() async {
    final user = await authRepo.autoLogin();

    setState(() => isGuest = authRepo.isGuest);

    if (user != null) {
      setState(() => userModel = user);
    }
  }

  /// get profile data
  Future<void> getProfileData() async {
    try {
      final user = await authRepo.getProfileData();
      if (user != null) {
        setState(() {
          userModel = user;
          _namecontroller.text = user.name;
          _emailcontroller.text = user.email;
          _deliverycontroller.text = user.address ?? "";
          _visacontroller.text = user.visa ?? "";
          networkImage = user.image;
          isLoading = false;
        });
      }
    } catch (e) {
      String message = "unhandeled erorr in profile";

      if (e is ApiErorr) {
        message = e.message;
      }

      ScaffoldMessenger.of(context).showSnackBar(customSnack(message));
    }
  }

  Future<void> updateProfileData() async {
    try {
      setState(() {
        isLoading = true;
      });

      final user = await authRepo.updateProfileData(
        name: _namecontroller.text.trim(),
        email: _emailcontroller.text.trim(),
        address: _deliverycontroller.text.trim(),
        visa: _visacontroller.text.trim(),
        imagePath: selectedImage?.path,
      );

      if (user != null) {
        setState(() {
          userModel = user;
          _namecontroller.text = user.name;
          _emailcontroller.text = user.email;
          _deliverycontroller.text = user.address ?? "";
          _visacontroller.text = user.visa ?? "";
        });

        ScaffoldMessenger.of(context).showSnackBar(
          customSnack("Profile updated successfully", color: Colors.green),
        );
      }

      await getProfileData();
    } catch (e) {
      String message = "Unhandled error in profile";

      if (e is ApiErorr) {
        message = e.message;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(customSnack(message, color: Colors.red));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> logout() async {
    try {
      await authRepo.logout();

      Navigator.pushNamedAndRemoveUntil(context, loginRouter, (route) => false);
    } catch (e) {
      String message = "unhandeled erorr in logout";

      if (e is ApiErorr) {
        message = e.message;
      }

      ScaffoldMessenger.of(context).showSnackBar(customSnack(message));
    }
  }

  /// pick image
  Future<void> _uploadImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _visacontroller.dispose();
    _deliverycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isGuest) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        ),
        body: isLoading
            ? const Center(
                child: CupertinoActivityIndicator(color: Colors.black),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 200),
                child: Column(
                  children: [
                    const Gap(20),

                    /// Profile Image
                    Center(
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              blurRadius: 10,
                            ),
                          ],
                          border: Border.all(color: Colors.white38, width: 6),
                        ),
                        child: ClipOval(
                          child: selectedImage != null
                              ? Image.file(
                                  File(selectedImage!.path),
                                  fit: BoxFit.cover,
                                )
                              : (userModel!.image != null)
                              ? Image.network(
                                  userModel!.image!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.person, size: 80),
                                )
                              : const Icon(Icons.person, size: 80),
                        ),
                      ),
                    ),

                    const Gap(10),

                    CustomButton(
                      text: isUpdatingImage ? "Update Image" : "Upload image",
                      onTap: () {
                        if (userModel!.image != null) {
                          setState(() {
                            isUpdatingImage = !isUpdatingImage;
                          });
                        }
                        _uploadImage();
                      },
                      height: 40,
                      redius: 10,
                      width: 150,
                    ),

                    const Gap(40),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomInputField(
                        label: "Name",
                        controller: _namecontroller,
                      ),
                    ),

                    const Gap(30),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomInputField(
                        label: "Email",
                        controller: _emailcontroller,
                      ),
                    ),

                    const Gap(30),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomInputField(
                        label: "Address",
                        controller: _deliverycontroller,
                      ),
                    ),

                    const Gap(30),

                    const Divider(indent: 30, endIndent: 30, thickness: 2),

                    const Gap(10),

                    (userModel?.visa == null || userModel!.visa!.isEmpty)
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomInputField(
                              label: "Add Visa",
                              controller: _visacontroller,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: CheckOutWidget(
                              trailling: const CustomText(
                                text: "Default",
                                color: Colors.black,
                              ),
                              values: "Debit",
                              groupValue: "Debit",
                              image: Image.asset("assets/logo/image 13.png"),
                              color: Colors.lightBlueAccent.shade100,
                              title: const CustomText(
                                text: "Debit card",
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              subtitle: CustomText(
                                text: userModel!.visa!,
                                color: Colors.black,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
        bottomSheet: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileBtn(
                onTab: updateProfileData,
                color: PrimaryColors.primaryColor,
                text: "Edit Profile",
                textcolor: Colors.white,
                icon: Icons.edit,
              ),
              ProfileBtn(
                onTab: logout,
                text: "Logout",
                textcolor: PrimaryColors.primaryColor,
                icon: Icons.logout,
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(text: "You are guest"),
              const Gap(20),
              CustomButton(
                text: "Login",
                onTap: () {
                  Navigator.pushNamed(context, loginRouter);
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}

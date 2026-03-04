import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constant/app_color.dart';
import 'package:hungry_app/features/auth/widgets/custom_profile_textfield.dart';
import 'package:hungry_app/features/auth/widgets/profile_btn.dart';
import 'package:hungry_app/features/check_out/widgets/check_out_widget.dart';
import 'package:hungry_app/features/check_out/widgets/order_details_widgets.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/pop_icon.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _deliverycontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();

  @override
  void initState() {
    _emailcontroller.text = "ahmedatwaa2010@gmai.com";
    _passcontroller.text = "ALES";
    _deliverycontroller.text = "Egypt";
    _namecontroller.text = "ahmed";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColors.primaryColor,
      appBar: AppBar(
        backgroundColor: PrimaryColors.primaryColor,
        leading: PopIcon(color: Colors.white),
      ),

      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 200),
          child: Column(
            children: [
              Gap(20),
              Center(
                child: Container(
                  width: 126,
                  height: 129,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 8),
                    color: Colors.grey.shade400,
                  ),
                  child: Icon(Icons.person, color: Colors.grey, size: 45),
                ),
              ),
              Gap(50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomInputField(
                  label: "Name",
                  controller: _namecontroller,
                ),
              ),
              Gap(35),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomInputField(
                  label: "Email",
                  controller: _emailcontroller,
                ),
              ),
              Gap(35),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomInputField(
                  label: "Delivery address",
                  controller: _deliverycontroller,
                ),
              ),
              Gap(35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomInputField(
                  label: "Password",
                  controller: _passcontroller,
                ),
              ),
              Gap(25),
              Divider(indent: 30, endIndent: 30, thickness: 2),
              Gap(25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CheckOutWidget(
                  trailling: CustomText(text: "Default", color: Colors.black),
                  values: "Debit",
                  groupValue: "Debit",
                  image: Image.asset("assets/logo/image 13.png"),
                  color: Color(0xffF3F4F6),
                  title: CustomText(
                    text: "Debit card",
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  subtitle: CustomText(
                    text: "3566 **** **** 0505",
                    color: Color(0xff808080),
                  ),
                ),
              ),
            ],
          ),
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
              color: PrimaryColors.primaryColor,
              text: "Edit Profile",
              textcolor: Colors.white,
              icon: Icons.edit,
            ),
            ProfileBtn(
              text: "Logout",
              textcolor: PrimaryColors.primaryColor,
              icon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}

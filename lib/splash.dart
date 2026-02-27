import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry_app/core/constant/app_color.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/root.dart';

class SplahView extends StatefulWidget {
  const SplahView({super.key});

  @override
  State<SplahView> createState() => _SplahViewState();
}

class _SplahViewState extends State<SplahView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<double> _scale;
  late Animation<Offset> _slideUp;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1750),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _scale = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _slideUp = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();

    // Navigate after 2.5 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Root()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColors.primaryColor,
      body: Center(
        child: Column(
          children: [
            const Gap(280),

            // 🔹 Logo animation (fade + scale)
            ScaleTransition(
              scale: _scale,
              child: FadeTransition(
                opacity: _fade,
                child: SvgPicture.asset('assets/logo/logo.svg'),
              ),
            ),

            const Spacer(),

            // 🔹 Image animation (fade + slide up)
            FadeTransition(
              opacity: _fade,
              child: SlideTransition(
                position: _slideUp,
                child: Image.asset('assets/splash/Hungry.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

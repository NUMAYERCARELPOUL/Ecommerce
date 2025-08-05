import 'package:e_commerce_app/screens/splash_screen/view_model/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../main_screen/view/main_screen_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    final viewModel = context.read<SplashScreenViewModel>();
    viewModel.init(this, this, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreenView()),
      );
    });
  }

  @override
  void dispose() {
    context.read<SplashScreenViewModel>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SplashScreenViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: viewModel.fadeAnimation,
          child: Text(
            "Ecommerce",
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w600,
              fontSize: 40.sp,
            ),
          ),
        ),
      ),
    );
  }
}

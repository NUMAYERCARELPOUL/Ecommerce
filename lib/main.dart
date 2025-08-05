import 'package:e_commerce_app/screens/cart_screen/view_model/cart_screen_view_model.dart';
import 'package:e_commerce_app/screens/home_screen/repository/home_screen_products_repo.dart';
import 'package:e_commerce_app/screens/home_screen/view_model/home_screen_view_model.dart';
import 'package:e_commerce_app/screens/main_screen/view_model/main_screen_viewmodel.dart';
import 'package:e_commerce_app/screens/splash_screen/view/splash_screen_view.dart';
import 'package:e_commerce_app/screens/splash_screen/view_model/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashScreenViewModel()),
        ChangeNotifierProvider(create: (_) => MainScreenViewModel()),
        ChangeNotifierProvider(create: (_) => ProductViewModel(repository: ProductRepository())),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
        // ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: child,
      ),
      child: const SplashScreenView(),
    );
  }
}

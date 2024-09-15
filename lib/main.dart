import 'package:ddeelly/features/Auth/bloc/auth_bloc.dart';
import 'package:ddeelly/features/Auth/ui/login_screen.dart';
import 'package:ddeelly/utils/constants/app_theme.dart';
import 'package:ddeelly/utils/constants/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,designSize: const Size(375, 812));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(),lazy: false,)
      ],
      child: MaterialApp(
        navigatorKey: NavigatorService.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeData,
        home: const LoginScreen(),
      ),
    );
  }
}

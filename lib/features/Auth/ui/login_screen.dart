import 'package:ddeelly/commonWidgets/app_outlined_button.dart';
import 'package:ddeelly/features/Auth/bloc/auth_bloc.dart';
import 'package:ddeelly/features/Home/ui/screens/home_screen.dart';
import 'package:ddeelly/gen/assets.gen.dart';
import 'package:ddeelly/utils/constants/app_colors.dart';
import 'package:ddeelly/utils/constants/app_dimensions.dart';
import 'package:ddeelly/utils/constants/app_strings.dart';
import 'package:ddeelly/utils/constants/app_text_styles.dart';
import 'package:ddeelly/utils/constants/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool agreeTandT = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailCtrl = TextEditingController(text: "temp17706@gmail.com");
  final TextEditingController _passCtrl = TextEditingController(text: "123456789");
  late final AuthBloc authBloc;


  @override
  void initState() {
    super.initState();
  authBloc = BlocProvider.of<AuthBloc>(context);

  }


  @override
  void dispose() {
    super.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: authBloc,
        listener: (context, state) {
          print("state is $state");
          if(state is AuthSignInSuccess){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(("Sign in Success"))));
          }
          if(state is AuthSignInError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
          }
          if(state is AuthSignInNoInternet){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(("No Internet Available"))));

          }
        },
        builder: (context, state) => Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top,
              left: AppDimensions.horizontalPadding,
              right: AppDimensions.horizontalPadding,
            bottom: MediaQuery.of(context).viewPadding.bottom
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 36.h,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.arrow_back),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        AppStrings.signIn,
                        style: AppTextStyles.f25w600,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 74.h,
                  ),
                  Align(alignment: Alignment.center, child: SvgPicture.asset(Assets.images.ddeellyLogo)),
                  SizedBox(
                    height: 74.h,
                  ),
                  Text(
                    AppStrings.email,
                    style: AppTextStyles.f18w400,
                  ),
                  TextFormField(
                    controller: _emailCtrl,
                    style: AppTextStyles.f16w400,
                    validator: AppValidators.emailValidator,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                  ),
                  SizedBox(
                    height: 31.h,
                  ),
                  Text(
                    AppStrings.password,
                    style: AppTextStyles.f18w400,
                  ),
                  TextFormField(
                    controller: _passCtrl,
                    style: AppTextStyles.f16w400,
                    decoration: const InputDecoration(hintText: AppStrings.password),
                    validator: AppValidators.passwordValidator,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        AppStrings.forgotPassword,
                        style: AppTextStyles.f12w400.copyWith(color: AppColors.blueColor),
                      )),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: agreeTandT,
                        onChanged: (value) {
                          setState(() {
                            agreeTandT = value!;
                          });
                        },
                      ),
                      Text(
                        AppStrings.agreeTermsAndConditions,
                        style: AppTextStyles.f12w400.copyWith(color: AppColors.greyColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 54.h,),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(text: TextSpan(
                        style: AppTextStyles.f14w400.copyWith(color: AppColors.blackColor),
                        children: [
                          const TextSpan(
                              text: AppStrings.doNotHaveAccount
                          ),
                          TextSpan(
                              style: AppTextStyles.f14w600.copyWith(color: AppColors.greenColor),
                              text: " ${AppStrings.signUp}")
                        ]
                    )),
                  ),
                  SizedBox(height: 73.h,),
                  AppOutlinedButton(
                    child:
                    Builder(
                      builder: (context) {
                        print("$state builddddd");
                        if(state is AuthSignInLoading){
                          return const CircularProgressIndicator(color: AppColors.whiteColor,);
                        }
                        return const Text(AppStrings.login);
                      }
                    ),
                    onPressed: () {
                    // Navigator.push(context,  MaterialPageRoute(builder: (context) => HomePage(),));
                    // Navigator.push(context,  MaterialPageRoute(builder: (context) => HomeScreen(),));
                    authBloc.add(AuthSignIn(
                        email: _emailCtrl.text.trim(),
                        password: _passCtrl.text.trim(),
                        signInFormKey: _formKey));
                  },),
                  SizedBox(height: 26.h,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/app_regex.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/top_app_bar.dart';
import '../controller/auth_cubit.dart';
import '../widgets/sign_in_bloc_listener.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  void enter() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().signIn(_emailController.text);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(title: 'تسجيل الدخول'),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildHeader(),
                  verticalSpace(40),
                  _buildEmailField(),
                  verticalSpace(24),
                  AppTextButton(onPressed: enter, buttonText: 'الدخول'),
                  const SignInBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManager.blue.withAlpha(10),
          ),
          child: Icon(
            Icons.email_outlined,
            size: 48.r,
            color: ColorsManager.blue,
          ),
        ),
        verticalSpace(16),
        Text('تسجيل الدخول', style: TextStyles.font20BlackBold),
        verticalSpace(8),
        Text(
          'أدخل بريدك الإلكتروني للمتابعة',
          style: TextStyles.font14GreyRegular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('البريد الإلكتروني', style: TextStyles.font14BlackMedium),
        verticalSpace(16),
        AppTextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          hintText: 'أدخل بريدك الإلكتروني',
          prefixIcon: HugeIcons.strokeRoundedMail01,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء إدخال البريد الإلكتروني.';
            } else if (!AppRegex.isEmailValid(value)) {
              return 'الرجاء إدخال بريد إلكتروني صحيح.';
            }
            return null;
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/top_app_bar.dart';
import '../controller/auth_cubit.dart';
import '../widgets/verify_otp_bloc_listener.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email, required this.otpKey});

  final String email;
  final String otpKey;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpCodeController = TextEditingController();

  void verify() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().verifyOtp(
        widget.email,
        _otpCodeController.text,
        widget.otpKey,
      );
    }
  }

  @override
  void dispose() {
    _otpCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(title: 'التحقق من الرمز'),
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
                  verticalSpace(24),
                  _buildOtpField(),
                  verticalSpace(12),
                  AppTextButton(onPressed: verify, buttonText: 'التحقق'),
                  const VerifyOtpBlocListener(),
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
          child: Icon(Icons.verified, size: 48.r, color: ColorsManager.blue),
        ),
        verticalSpace(16),
        Text('التحقق من الرمز', style: TextStyles.font20BlackBold),
        verticalSpace(8),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'تم إرسال رمز التحقق إلى\n',
            style: TextStyles.font14GreyRegular.copyWith(height: 1.6),
            children: [
              TextSpan(text: widget.email, style: TextStyles.font16BlackBold),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOtpField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('رمز التحقق', style: TextStyles.font14BlackMedium),
        verticalSpace(16),
        AppTextField(
          controller: _otpCodeController,
          hintText: 'أدخل رمز التحقق (6 أرقام)',
          keyboardType: TextInputType.number,
          maxLength: 6,
          prefixIcon: HugeIcons.strokeRoundedSmsCode,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء إدخال رمز التحقق.';
            } else if (value.length != 6) {
              return 'الرمز يجب أن يكون 6 أرقام.';
            }
            return null;
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/networking/dio_factory.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/app_regex.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/countries.dart';
import '../../../../core/utils/shared_pref_helper.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../domain/model/user_profile.dart';
import '../controller/profile_cubit.dart';
import 'delete_confirmation_dialog.dart';
import 'profile_bloc_listener.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.profile});

  final UserProfile profile;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _initialCountryCode = 'TN';

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال الإسم.';
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال البريد الإلكتروني.';
    } else if (!AppRegex.isEmailValid(value)) {
      return 'الرجاء إدخال بريد إلكتروني صحيح.';
    }
    return null;
  }

  void seperatePhoneAndDialCode(String phoneWithDialCode) {
    Map<String, String> foundedCountry = {};
    for (var country in Countries.allCountries) {
      String dialCode = country["dial_code"].toString();
      if (phoneWithDialCode.contains(dialCode)) {
        foundedCountry = country;
      }
    }

    if (foundedCountry.isNotEmpty) {
      var newPhoneNumber = phoneWithDialCode.substring(
        foundedCountry["dial_code"]!.length,
      );
      _initialCountryCode = foundedCountry["code"]!;
      _phoneController.text = newPhoneNumber;
    }
  }

  void _save(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      String phoneNumber = _phoneController.text;
      String dialCode =
          Countries.allCountries.firstWhere(
            (country) => country['code'] == _initialCountryCode,
          )['dial_code']!;
      phoneNumber = '$dialCode$phoneNumber';
      context.read<ProfileCubit>().updateProfile(
        name: _nameController.text,
        email: _emailController.text,
        phoneNumber: phoneNumber,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.profile.name ?? '';
    _emailController.text = widget.profile.email ?? '';
    seperatePhoneAndDialCode(widget.profile.phoneNumber ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _deleteAccount(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) => const DeleteConfirmationDialog(),
    );
    if (result == true) {
      await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, '');
      DioFactory.setTokenIntoHeaderAfterLogin('');
      isLoggedInUser = false;
      if (context.mounted) {
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('الإسم', style: TextStyles.font14BlackMedium),
            verticalSpace(8),
            AppTextField(
              controller: _nameController,
              hintText: 'الإسم',
              validator: (value) => _nameValidator(value),
            ),
            verticalSpace(16),
            Text('البريد الإلكتروني', style: TextStyles.font14BlackMedium),
            verticalSpace(8),
            AppTextField(
              controller: _emailController,
              hintText: 'البريد الإلكتروني',
              validator: (value) => _emailValidator(value),
              keyboardType: TextInputType.emailAddress,
            ),
            verticalSpace(16),
            Text('رقم الهاتف', style: TextStyles.font14BlackMedium),
            verticalSpace(8),
            IntlPhoneField(
              initialCountryCode: _initialCountryCode,
              controller: _phoneController,
              invalidNumberMessage: 'رقم الهاتف خاطئ',
              onCountryChanged: (country) {
                setState(() {
                  _initialCountryCode = country.code;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorsManager.white,
                isDense: true,
                errorStyle: TextStyles.font10RedRegular,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 20.h,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorsManager.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorsManager.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorsManager.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorsManager.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintStyle: TextStyles.font14BlackRegular,
                hintText: 'رقم الهاتف',
              ),
              textAlign: TextAlign.right,
              languageCode: 'ar',
              pickerDialogStyle: PickerDialogStyle(
                backgroundColor: ColorsManager.white,
                countryCodeStyle: TextStyles.font12BlackRegular,
                countryNameStyle: TextStyles.font14BlackMedium,
                searchFieldInputDecoration: InputDecoration(
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: ColorsManager.grey,
                    size: 30.h,
                  ),
                  errorStyle: TextStyles.font10RedRegular,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 20.h,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsManager.lightGrey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsManager.lightGrey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsManager.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsManager.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  hintStyle: TextStyles.font14GreyRegular,
                  hintText: 'إبحث عن البلد',
                ),
              ),
              validator: (value) {
                if (value == null || value.completeNumber.isEmpty) {
                  return 'يرجى إدخال رقم هاتف صالح';
                }
                return null;
              },
            ),
            verticalSpace(16),
            AppTextButton(buttonText: 'حفظ', onPressed: () => _save(context)),
            verticalSpace(16),
            AppTextButton(
              buttonText: 'حذف الحساب',
              backgroundColor: Colors.transparent,
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  side: const BorderSide(color: ColorsManager.red),
                ),
              ),
              textStyle: TextStyles.font14RedSemiBold,
              onPressed: () => _deleteAccount(context),
            ),
            const ProfileBlocListener(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/component/bottom_component.dart';
import '../../../core/component/text_from_filed_component.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/screen_size.dart';
import '../controller/register_bloc.dart';
import '../model/password_complexity_setting_model.dart';
import 'company_name_screen.dart';

class EmailAndPasswordScreen extends StatefulWidget {
  final PasswordComplexitySettingModel setting;

  const EmailAndPasswordScreen({super.key, required this.setting});

  @override
  State<EmailAndPasswordScreen> createState() =>
      _EmailAndPasswordScreenState();
}

class _EmailAndPasswordScreenState extends State<EmailAndPasswordScreen> {
  String password = "";
  String email = "";
  bool isSecret = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get hasUpper => password.contains(RegExp(r'[A-Z]'));
  bool get hasLower => password.contains(RegExp(r'[a-z]'));
  bool get hasDigit => password.contains(RegExp(r'[0-9]'));
  bool get hasSymbol => password.contains(RegExp(r'[^A-Za-z0-9]'));
  bool get hasMinLength =>
      password.length >= (widget.setting.requiredLength ?? 0);

  bool isConditionPassed(bool? required, bool actual) {
    if (required == null || required == false) return true;
    return actual;
  }

  double calculateStrength() {
    int total = 0;
    int passed = 0;

    if (widget.setting.requireUppercase == true) {
      total++;
      if (hasUpper) passed++;
    }
    if (widget.setting.requireLowercase == true) {
      total++;
      if (hasLower) passed++;
    }
    if (widget.setting.requireDigit == true) {
      total++;
      if (hasDigit) passed++;
    }
    if (widget.setting.requireNonAlphanumeric == true) {
      total++;
      if (hasSymbol) passed++;
    }
    total++;
    if (hasMinLength) passed++;
    return passed / total;
  }

  bool isPasswordValid() {
    return isConditionPassed(widget.setting.requireUppercase, hasUpper) &&
        isConditionPassed(widget.setting.requireLowercase, hasLower) &&
        isConditionPassed(widget.setting.requireDigit, hasDigit) &&
        isConditionPassed(widget.setting.requireNonAlphanumeric, hasSymbol) &&
        hasMinLength;
  }

  bool isEmailValid() {
    if (email.trim().isEmpty) return false;
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email.trim());
  }

  Widget _buildCheckItem(BuildContext context, bool valid, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(valid ? Icons.check : Icons.close,
              color: valid ? Colors.green : Colors.red, size: 18),
          SizedBox(width: 8),
          Text(text, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: mainColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enter a strong password",
                    style: Theme.of(context).textTheme.titleSmall),
                SizedBox(height: 5),
                Text("Let's start an amazing journey! 👋",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey)),
                SizedBox(height: screenHeight(context) * 0.15),

                Text("Your work email",
                    style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: screenHeight(context) * 0.01),
                TextFromFiledComponent(
                  controller: registerBloc.emailController,
                  inputType: TextInputType.emailAddress,
                  priffix: Icon(Icons.email_outlined, color: Colors.grey),
                  suffix: IconButton(
                    icon: Icon(Icons.close_outlined, color: Colors.grey),
                    onPressed: () {
                      registerBloc.emailController.clear();
                      setState(() {
                        email = "";
                      });
                    },
                  ),
                  onChanged: (v) {
                    setState(() {
                      email = v;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Enter Your Email";
                    }
                    final regex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                    if (!regex.hasMatch(value.trim())) {
                      return "The Email Form is Wrong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight(context) * 0.03),

                Text("Your password",
                    style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: screenHeight(context) * 0.01),
                TextFromFiledComponent(
                  isSecret: isSecret,
                  controller: registerBloc.passController,
                  priffix: Icon(Icons.lock_outline, color: Colors.grey),
                  suffix: IconButton(
                    icon: Icon(isSecret
                        ? Icons.visibility
                        : Icons.visibility_off, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        isSecret = !isSecret;
                      });
                    },
                  ),
                  inputType: TextInputType.text,
                  onChanged: (v) {
                    setState(() {
                      password = v;
                    });
                  },
                ),
                SizedBox(height: screenHeight(context) * 0.02),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: calculateStrength(),
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation(
                      calculateStrength() < 0.4
                          ? Colors.red
                          : calculateStrength() < 0.8
                          ? Colors.orange
                          : Colors.green,
                    ),
                    minHeight: 8,
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Icon(
                        isPasswordValid()
                            ? Icons.check
                            : Icons.warning_amber,
                        color: isPasswordValid()
                            ? Colors.green
                            : Colors.orangeAccent,
                        size: 20),
                    SizedBox(width: 8),
                    Text("Password strength",
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),

                if (widget.setting.requireUppercase == true)
                  _buildCheckItem(
                      context, hasUpper, "Must contain uppercase (A-Z)"),
                if (widget.setting.requireLowercase == true)
                  _buildCheckItem(
                      context, hasLower, "Must contain lowercase (a-z)"),
                if (widget.setting.requireDigit == true)
                  _buildCheckItem(
                      context, hasDigit, "Must contain at least one number"),
                if (widget.setting.requireNonAlphanumeric == true)
                  _buildCheckItem(context, hasSymbol, "Must contain symbol (!@#\$...)"),
                _buildCheckItem(
                  context,
                  hasMinLength,
                  "Must be at least ${widget.setting.requiredLength} characters",
                ),
                SizedBox(height: screenHeight(context) * 0.02),

                SizedBox(
                  width: double.infinity,
                  child: BottomComponent(
                    color: (isPasswordValid() && isEmailValid())
                        ? mainColor
                        : grayColor,
                    onTap: () {
                      if (!isPasswordValid() || !isEmailValid()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                              Text("Please fix email and password fields")),
                        );
                        return;
                      }
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompanyNameScreen()),
                        );
                      }
                    },
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        Text("Confirm password",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: whitColor)),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: whitColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.arrow_forward_ios_rounded,
                              size: 16, color: whitColor),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight(context)*0.1,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Stay organized with",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: grayColor)),
                    Image.asset("assets/images/splash.png",width: 100,)

                  ],
                ),
                SizedBox(height: screenHeight(context)*0.02,),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

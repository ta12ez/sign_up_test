import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/featuers/register/controller/register_bloc.dart';

import '../../../core/component/bottom_component.dart';
import '../../../core/component/text_from_filed_component.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/screen_size.dart';
import '../../home_screen.dart';

class CompanyNameScreen extends StatefulWidget {
  CompanyNameScreen({super.key});

  @override
  State<CompanyNameScreen> createState() => _CompanyNameScreenState();
}

class _CompanyNameScreenState extends State<CompanyNameScreen> {
  final TextEditingController companyName = TextEditingController();

  final TextEditingController firstName = TextEditingController();

  final TextEditingController lastName = TextEditingController();
  bool companyNameValid=false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool  isFormValid(RegisterBloc registerBloc) {
    return companyName.text.isNotEmpty &&
        firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        RegExp(r'^[A-Za-z][A-Za-z0-9-]*$').hasMatch(companyName.text) &&
        RegExp(r'^[A-Za-z]+$').hasMatch(firstName.text) &&
        RegExp(r'^[A-Za-z]+$').hasMatch(lastName.text) &&
        registerBloc.isTenantAvailableModel?.tenantId == null;}

  @override
  void initState() {
    super.initState();
    companyName.addListener(() => setState(() {}));
    firstName.addListener(() => setState(() {}));
    lastName.addListener(() => setState(() {}));
  }
  void _checkTenant(RegisterBloc registerBloc) {
    final name = companyName.text;

    if (name.isNotEmpty && RegExp(r'^[A-Za-z][A-Za-z0-9-]*$').hasMatch(name)) {
      companyNameValid=true;
      registerBloc.add(IsTenantAvailableEvent(tenantName: name));
    }else{
      companyNameValid=false;
    }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);
    if (registerBloc.currentLoginInformationsModel?.result?.tenant != null) {
      companyName.text =
          "${registerBloc.currentLoginInformationsModel?.result?.tenant?.tenancyName ?? ""}";
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: mainColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your company name",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 5),
                Text(
                  "Let's start an amazing journey! 👋",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                ),
                SizedBox(height: screenHeight(context) * 0.15),
                Text(
                  "Your company or team name",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: screenHeight(context) * 0.01),
                BlocBuilder<RegisterBloc, RegisterState>(
                  buildWhen:
                      (previous, current) =>
                          current is IsTenantAvailableLoading ||
                          current is IsTenantAvailableError ||
                          current is IsTenantAvailableSuccess,

                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Focus(
                          onFocusChange: (hasFocus) {
                            if (!hasFocus) {

                                _checkTenant(registerBloc);

                            }
                          },
                          child: TextFromFiledComponent(
                            controller: companyName,
                            validator: (value) {
                              {
                                if (value!.trim().isEmpty) {
                                  return "Please enter your company name.";
                                }

                                final regex = RegExp(
                                  r'^[A-Za-z][A-Za-z0-9-]*$',
                                );

                                if (!regex.hasMatch(value)) {
                                  return "Company name must start with a letter and can contain numbers and dashes only.";
                                }

                                return null; // valid
                              }
                            },
                            onFieldSubmitted: (String value) {
                                _checkTenant(registerBloc);
                            },
                            suffix:
                                state is IsTenantAvailableLoading
                                    ? Transform.scale(
                                      scale: 0.5,
                                      child: CircularProgressIndicator(
                                        color: mainColor,
                                      ),
                                    )
                                    : state is IsTenantAvailableError
                                    ? TextButton(
                                      onPressed: () {
                                        registerBloc.add(
                                          IsTenantAvailableEvent(
                                            tenantName: companyName.text,
                                          ),
                                        );
                                      },
                                      child: Text("ReTry"),
                                    )
                                    : Text(
                                      ".workiom.com",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: grayColor),
                                    ),
                            priffix: Icon(Icons.group, color: Colors.grey),
                            inputType: TextInputType.emailAddress,
                            hintText: "Workspace name*",
                          ),
                        ),
                        SizedBox(height: screenHeight(context) * 0.01),
                        companyNameValid==false? Text(
                          "Company name must start with a letter and can contain numbers and dashes only.",
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(color: Colors.red),
                        ):
                        state is IsTenantAvailableSuccess &&
                                state.isTenantAvailableModel.tenantId != null
                            ? Text(
                              "the Company Name is Taken",
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(color: Colors.red),
                            )
                            : SizedBox(),
                      ],
                    );
                  },
                ),
                SizedBox(height: screenHeight(context) * 0.03),
                Text(
                  "Your  first name",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: screenHeight(context) * 0.01),
                TextFromFiledComponent(
                  controller: firstName,
                  priffix: Icon(Icons.list, color: Colors.grey),
                  inputType: TextInputType.emailAddress,
                  hintText: "Enter your First name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name.";
                    }

                    if (!RegExp(r'^[A-Za-z]+$').hasMatch(value)) {
                      return "Name must contain letters only.";
                    }

                    return null;
                  },
                ),
                SizedBox(height: screenHeight(context) * 0.03),
                Text(
                  "Your  last name",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: screenHeight(context) * 0.01),
                TextFromFiledComponent(
                  controller: lastName,
                  priffix: Icon(Icons.list, color: Colors.grey),
                  inputType: TextInputType.emailAddress,
                  hintText: "Enter your Last name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name.";
                    }

                    if (!RegExp(r'^[A-Za-z]+$').hasMatch(value)) {
                      return "Name must contain letters only.";
                    }

                    return null;
                  },
                ),
                SizedBox(height: screenHeight(context) * 0.03),

                BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if(state is RegisterTenantSuccess){
      registerBloc.add(AuthenticateEvent(emailAddress: registerBloc.emailController.text, passWord: registerBloc.passController.text, tenancyName: companyName.text));
          }
          if(state is AuthenticateSuccess){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
          }
        },
        builder: (context, state) {
          return SizedBox(
                  width: double.infinity,
                  child: BottomComponent(
                    color: isFormValid(registerBloc) ? mainColor : grayColor,
                    onTap: () {
                      if(formKey.currentState!.validate()&&isFormValid(registerBloc)) {
                        registerBloc.add(RegisterTenantEvent(adminFirstName: firstName.text, adminLastName: lastName.text, tenancyName: companyName.text));
                      }

                    },
                    widget:state is RegisterTenantLoading||state is AuthenticateLoading? Center(child: CircularProgressIndicator(color: whitColor,),):Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        Text(
                          "Create Workspace",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(color: whitColor),
                        ),
                        Spacer(),

                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: whitColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: whitColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/component/bottom_component.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/screen_size.dart';
import '../controller/register_bloc.dart';
import 'email_and_password_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Row(
          children: [
            Icon(Icons.arrow_back_ios_new,color: mainColor,),
            SizedBox(width: 5,),
            Text("Sigin in",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: mainColor),),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create your free account",style: Theme.of(context).textTheme.titleSmall,),
              SizedBox(height: 5,),
              Text("Let's start an amazing journey! 👋",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),),
              SizedBox(height: screenHeight(context)*0.3,),
              SizedBox(
                width: double.infinity,
                child: BottomComponent(color: Colors.grey[300]!, onTap: () {  }, widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Image.asset("assets/images/google.png"),
                    SizedBox(width: 5,),
                    Text("Continue with Google", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: blackColor)),
                    Spacer(),

                  ],
                ),),
              ),
              SizedBox(height: screenHeight(context)*0.02,),
              Center(child: Text("or",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),)),

              SizedBox(height: screenHeight(context)*0.02,),
              BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if(state is GetPasswordComplexitySettingSuccess){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailAndPasswordScreen(setting: state.passwordComplexitySettingModel,)));

          }
        },
        builder: (context, state) {
          RegisterBloc registerBloc=BlocProvider.of<RegisterBloc>(context);
          return SizedBox(
                width: double.infinity,
                child: BottomComponent(color: mainColor, onTap: () {
                  registerBloc.add(GetPasswordComplexitySettingEvent());
                }, widget:state is GetPasswordComplexitySettingLoading? Center(child: CircularProgressIndicator(color: whitColor,),):Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Text("Continue with email", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: whitColor)),
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
                    )
                  ],
                ),),
              );
        },
      ),
              SizedBox(height:screenHeight(context)*0.01 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("By signing up, you agree ",style: Theme.of(context).textTheme.bodySmall,),
                  GestureDetector(
                      onTap: (){},
                      child: Text("Terms Of Service ",style: Theme.of(context).textTheme.bodySmall!.copyWith(decoration: TextDecoration.underline),))

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("And ",style: Theme.of(context).textTheme.bodySmall),
                  GestureDetector(
                      onTap: (){},
                      child: Text("Privacy Policy",style: Theme.of(context).textTheme.bodySmall!.copyWith(decoration: TextDecoration.underline)))


                ],
              ),
              SizedBox(height: screenHeight(context)*0.1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.language),
                  SizedBox(width: 10,),
                  Text("English",style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(width: 10,),
                  Icon(Icons.arrow_drop_down_sharp),

                ],
              ),
              SizedBox(height: screenHeight(context)*0.02,),
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
    );
  }
}

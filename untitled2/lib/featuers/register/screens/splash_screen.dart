import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/component/bottom_component.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/screen_size.dart';
import '../../home_screen.dart';
import '../controller/register_bloc.dart';
import 'editions_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);
    return BlocProvider.value(
      value: registerBloc..add(GetCurrentLoginInformationsEvent()),
      child: Scaffold(
        backgroundColor: mainColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/splash.png", width: screenWidth(context) * 0.8,
                height: screenHeight(context) * 0.3,),
              SizedBox(height: screenHeight(context) * 0.01,),
              BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if(state is GetCurrentLoginInformationsSuccess){
                    if(state.currentLoginInformationsModel.result!.user==null){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>EditionsScreen()));

                      if(state.currentLoginInformationsModel.result!.tenant==null){
                      }
                      else{

                      }
                    }else{
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));


                    }
                  }
                },
                builder: (context, state) {
                  if(state is GetCurrentLoginInformationsLoading){
                  return CircularProgressIndicator(color: whitColor,);
                  }else{
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BottomComponent(color: whitColor, onTap: (){
                        registerBloc.add(GetCurrentLoginInformationsEvent());
                      }, widget: Center(child: Text("reTry",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: mainColor),))),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

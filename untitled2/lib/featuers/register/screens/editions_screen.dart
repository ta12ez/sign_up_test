import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/component/bottom_component.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/screen_size.dart';
import '../controller/register_bloc.dart';
import 'welcome_screen.dart';

class EditionsScreen extends StatelessWidget {
  const EditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocProvider.value(
          value: registerBloc..add(GetEditionsForSelectEvent()),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if(state is GetEditionsForSelectLoading){
                  return Center(child: CircularProgressIndicator(color: mainColor,),);
                }else if(registerBloc.editionsForSelectModel!=null){
                  var items=registerBloc.editionsForSelectModel!.result!.editionsWithFeatures;
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: items.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: screenWidth(context) * 0.05,
                                      mainAxisSpacing: screenHeight(context) * 0.015,
                                      childAspectRatio: 3 / 4,
                            ),
                            itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: (){
                                          registerBloc.add(SelectEditionsForSelectEvent(editionsWithFeature: items[index]));
                                        },
                                        child: Card(
                                          clipBehavior: Clip.hardEdge,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                            side: registerBloc.selectedEditionsWithFeature?.edition?.id==items[index].edition?.id? BorderSide(
                                              color: mainColor,
                                              width: 2,
                                            ):BorderSide.none,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                          Text("${items[index].edition?.displayName}",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: mainColor),),

                          SizedBox(height: 20,),
                          Text("month:${items[index].edition?.monthlyPrice??""}",style: Theme.of(context).textTheme.bodyMedium,),
                          SizedBox(height: 20,),
                          Text("annual:${items[index].edition?.annualPrice??""}",style: Theme.of(context).textTheme.bodyMedium,),
                          SizedBox(height: 20,),
                          Text("isOpen:${items[index].edition?.isRegistrable==true?"yes":"no"}",style: Theme.of(context).textTheme.bodyMedium,),
                          SizedBox(height: 20,),
                          Text("hasTrial:${items[index].edition?.hasTrial==true?"yes":"no"}",style: Theme.of(context).textTheme.bodyMedium,),

                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight(context)*0.01,),
                        BottomComponent(color:registerBloc.selectedEditionsWithFeature !=null? mainColor:Colors.grey, onTap: (){
                          if(registerBloc.selectedEditionsWithFeature !=null) {
                            Navigator.push(context, MaterialPageRoute(builder:(context) =>WelcomeScreen()));
                          }
                        }, widget: Center(child: Text("Next",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: whitColor),))),
                        SizedBox(height: screenHeight(context)*0.01,),
                      ],
                    ),
                  );

                }else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("NoData",style: Theme.of(context).textTheme.titleSmall,),
                    SizedBox(height: screenHeight(context)*0.01,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BottomComponent(color: mainColor, onTap: (){
                        registerBloc.add(GetEditionsForSelectEvent());
                      }, widget: Center(child: Text("restart",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: whitColor),))),
                    )
                    ],
                  );
                }
              },
            ),

            SizedBox(height: screenHeight(context)*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Stay organized with",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: grayColor)),
                Image.asset("assets/images/splash.png",width: 100,)

              ],
            ),
          ],
        ),
),
      ),
    );
  }
}

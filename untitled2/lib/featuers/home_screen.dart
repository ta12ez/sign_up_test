import 'package:flutter/material.dart';

import '../core/constant/color.dart';
import '../core/services/screen_size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Spacer(),
               Text("Thank you for choosing",style: Theme.of(context).textTheme.titleMedium,),
               Row(
                 children: [
                   Text(" Workiom",style: Theme.of(context).textTheme.titleMedium,),
                   SizedBox(width: 5,),
                   Image.asset("assets/images/Symbol.png")
                 ],
               ),
               Spacer(),
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

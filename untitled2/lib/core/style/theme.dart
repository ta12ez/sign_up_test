import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/color.dart';
//
// // ألوان الوضع الداكن
// const darkBackgroundColor = Color(0xFF1E1E1E);
// const darkCardColor = Color(0xFF2E2E2E);
// const darkAvatarColor = Color(0xFF3A3A3A);

// Light Theme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  focusColor: mainColor,
  scaffoldBackgroundColor: backgroundColor,
  cardColor: Colors.white,
  // DatePicker Theme
  datePickerTheme: DatePickerThemeData(
    yearStyle: const TextStyle(
      fontFamily: 'Satoshi',   // الأرقام للسنة
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: blackColor,
    ),
    dayStyle: const TextStyle(
      fontFamily: 'Satoshi',   // الأرقام للأيام
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: blackColor,
    ),

    weekdayStyle: const TextStyle(
      fontFamily: 'GE_SS_Two', // أيام الأسبوع (كلمات)
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: blackColor,
    ),
    headerHeadlineStyle: const TextStyle(
      fontFamily: 'GE_SS_Two', // الشهر في الهيدر (كلمات)
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),

    headerHelpStyle: const TextStyle(
      fontFamily: 'GE_SS_Two',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  ),
    // تخصيص أزرار TextButton (مثل إلغاء/حسناً)
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontFamily: 'GE_SS_Two', // الخط اللي تحبه للأزرار
        ),)),
  colorScheme: ColorScheme.light(
    primary: mainColor, // اللون الرئيسي (كان أزرق)
    onSurface: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(color: blackColor, fontSize: 25),
    actionsIconTheme: IconThemeData(color: blackColor),
    iconTheme: IconThemeData(color: blackColor),
  ),

  textTheme: TextTheme(
    titleLarge: TextStyle(
        fontWeight: FontWeight.w500, color: blackColor, fontSize: 35),
    titleMedium: TextStyle(
        fontWeight: FontWeight.w500, color: blackColor, fontSize: 25),
    titleSmall: TextStyle(
        color: blackColor, fontSize: 20, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(color: blackColor, fontSize: 20,fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(color: blackColor, fontSize: 15,fontWeight: FontWeight.w400),
    bodySmall: TextStyle(color: blackColor, fontSize: 12,fontWeight: FontWeight.w400),
    labelSmall: TextStyle(color: Colors.grey, fontSize: 10,fontWeight: FontWeight.w300),

  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.grey,
    selectedItemColor: mainColor,
    elevation: 20,
    backgroundColor: whitColor,
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
  ),


  dialogTheme: DialogTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(color: blackColor, fontSize: 20),
    contentTextStyle: TextStyle(color: blackColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
);

// Dark Theme
ThemeData darkTheme = ThemeData(
  //fontFamily: "Alarmi",
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkBackgroundColor,
  cardColor: darkCardColor,
  dialogBackgroundColor: blackColor,

  appBarTheme: const AppBarTheme(
    backgroundColor: darkBackgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
    actionsIconTheme: IconThemeData(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  textTheme: TextTheme(
    titleLarge: TextStyle(
        fontWeight: FontWeight.bold, color: whitColor, fontSize: 35.sp),
    titleMedium: TextStyle(
        fontWeight: FontWeight.bold, color: whitColor, fontSize: 32.sp),
    titleSmall: TextStyle(
        color: whitColor, fontSize: 20.sp, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: whitColor, fontSize: 20.sp),
    bodyMedium: TextStyle(color: whitColor, fontSize: 16.sp),
    bodySmall: TextStyle(color: whitColor, fontSize: 12.sp),
    labelSmall: TextStyle(color: Colors.grey, fontSize: 12.sp),
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.grey,
    selectedItemColor: mainColor,
    elevation: 20,
    backgroundColor: blackColor,
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: darkCardColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
  ),

  dialogTheme: DialogTheme(
    backgroundColor: darkCardColor,
    titleTextStyle: TextStyle(color: whitColor, fontSize: 20),
    contentTextStyle: TextStyle(color: whitColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
);















// import 'package:flutter/material.dart';
// import 'package:travel_app/core/constant/color.dart';
//
//
// //light theme
//
// ThemeData lightTheme = ThemeData(
//     brightness: Brightness.light,
//     focusColor: mainColor,
//
//     // cardColor:cardColor,
//     appBarTheme:   AppBarTheme(
//       backgroundColor: backgroundColor,
//       elevation: 0,
//       titleTextStyle: TextStyle(color: blackColor,fontSize: 25),
//       actionsIconTheme: IconThemeData(color: blackColor),
//       iconTheme: IconThemeData(color: blackColor),
//
//     ),
//     //
//     textTheme: TextTheme(
//       titleLarge: TextStyle(
//           fontWeight: FontWeight.bold, color: blackColor, fontSize: 35),
//
//         titleMedium: TextStyle(
//             fontWeight: FontWeight.bold, color:blackColor, fontSize: 32),
//         //
//         titleSmall:TextStyle(
//           color: blackColor, fontSize: 20,fontWeight: FontWeight.bold,),
//         bodyLarge:TextStyle(
//           color: blackColor, fontSize: 20,),
//         bodySmall: TextStyle(
//           color: blackColor, fontSize: 12,),
//         bodyMedium: TextStyle(
//           color: blackColor, fontSize: 16,),
//         labelSmall: TextStyle(color: Colors.grey,fontSize: 12)
//     ),
//
//     scaffoldBackgroundColor:backgroundColor,
//
//
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       type: BottomNavigationBarType.fixed,
//       unselectedItemColor: Colors.grey,
//       selectedItemColor: mainColor,
//       elevation: 20,
//       backgroundColor:whitColor,
//     )
//
//
// );
// //dark
// // ThemeData darkTheme = ThemeData(
// //     fontFamily: "Alarmi",
// //     dialogBackgroundColor:  blackColor,
// //
// //     brightness: Brightness.dark,
// //     cardColor: Colors.grey[200]?.withAlpha(20),
// //     appBarTheme:  const AppBarTheme(
// //       color: blackColor,
// //       elevation: 0,
// //       titleTextStyle: TextStyle(color:Colors.white,fontSize: 25),
// //       actionsIconTheme: IconThemeData(color: Colors.white),
// //       iconTheme: IconThemeData(color:Colors.white),
// //
// //     ),
// //
// //     textTheme: TextTheme(
// //         titleLarge: TextStyle(
// //             fontWeight: FontWeight.bold, color: whitColor, fontSize: 35),
// //
// //         titleMedium: TextStyle(
// //             fontWeight: FontWeight.bold, color:whitColor, fontSize: 32),
// //         //
// //         titleSmall:TextStyle(
// //           color: whitColor, fontSize: 20,fontWeight: FontWeight.bold,),
// //         bodyLarge:TextStyle(
// //           color: whitColor, fontSize: 20,),
// //         bodySmall: TextStyle(
// //           color: whitColor, fontSize: 12,),
// //         bodyMedium: TextStyle(
// //           color: whitColor, fontSize: 16,),
// //         labelSmall: TextStyle(color: Colors.grey,fontSize: 12)
// //     ),
// //     scaffoldBackgroundColor: blackColor,
// //     //primarySwatch: defaultMatrialeColor,
// //
// //
// //     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
// //         type: BottomNavigationBarType.fixed,
// //         unselectedItemColor: Colors.grey,
// //         selectedItemColor: mainColor,
// //         elevation: 20,
// //         backgroundColor: blackColor
// //     )
// //
// //
// // );
//

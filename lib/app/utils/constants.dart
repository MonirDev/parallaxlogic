import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parallaxlogic/app/utils/colors.dart';

//String constants
class Constants {
  static const String appName = "Parallaxlogic";
  static const String baseUrl = 'https://fakestoreapi.com/';

  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String products = 'products';
  static const String pleaseWait = 'Please wait...';
  static const String tryAgain = 'Try Again';
  static const String failed = "Failed!";
  static const String somethingWentWrong = "Something went wrong!";
  static const String home = "Home";
  static const String viewAll = "View all";
  static const String menClothing = "men's clothing";
  static const String womenClothing = "women's clothing";
  static const String jewelery = "jewelery";
  static const String electronics = "electronics";
  static const String productDetails = "Product Details";
  static const String addToCart = "Add to cart";

  static const String sliderImg1 =
      "https://images.unsplash.com/photo-1542601098-3adb3baeb1ec?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5bb9a9747954cdd6eabe54e3688a407e&auto=format&fit=crop&w=500&q=60";
}

class ImagePath {
  // static const String appicon = "assets/appicon.png";
}

//////
//TextStyle
class AppTextStyle {
  //Bold Black
  static var bb30 = boldBlackTextStyle(30.sp);
  static var bb28 = boldBlackTextStyle(28.sp);
  static var bb24 = boldBlackTextStyle(24.sp);
  static var bb22 = boldBlackTextStyle(22.sp);
  static var bb20 = boldBlackTextStyle(20.sp);
  static var bb18 = boldBlackTextStyle(18.sp);
  static var bb16 = boldBlackTextStyle(16.sp);
  static var bb14 = boldBlackTextStyle(14.sp);
  static var bb12 = boldBlackTextStyle(12.sp);
  static var bb10 = boldBlackTextStyle(10.sp);
  //Normal black
  static var nb30 = normalBlackTextStyle(30.sp);
  static var nb28 = normalBlackTextStyle(28.sp);
  static var nb24 = normalBlackTextStyle(24.sp);
  static var nb22 = normalBlackTextStyle(22.sp);
  static var nb20 = normalBlackTextStyle(20.sp);
  static var nb18 = normalBlackTextStyle(18.sp);
  static var nb16 = normalBlackTextStyle(16.sp);
  static var nb14 = normalBlackTextStyle(14.sp);
  static var nb12 = normalBlackTextStyle(12.sp);
  static var nb10 = normalBlackTextStyle(10.sp);
  //Bold White
  static var bw30 = boldWhiteTextStyle(30.sp);
  static var bw28 = boldWhiteTextStyle(28.sp);
  static var bw24 = boldWhiteTextStyle(24.sp);
  static var bw22 = boldWhiteTextStyle(22.sp);
  static var bw20 = boldWhiteTextStyle(20.sp);
  static var bw18 = boldWhiteTextStyle(18.sp);
  static var bw16 = boldWhiteTextStyle(16.sp);
  static var bw14 = boldWhiteTextStyle(14.sp);
  static var bw12 = boldWhiteTextStyle(12.sp);
  static var bw10 = boldWhiteTextStyle(10.sp);
  //Normal White
  static var nw30 = normalWhiteTextStyle(30.sp);
  static var nw28 = normalWhiteTextStyle(28.sp);
  static var nw24 = normalWhiteTextStyle(24.sp);
  static var nw22 = normalWhiteTextStyle(22.sp);
  static var nw20 = normalWhiteTextStyle(20.sp);
  static var nw18 = normalWhiteTextStyle(18.sp);
  static var nw16 = normalWhiteTextStyle(16.sp);
  static var nw14 = normalWhiteTextStyle(14.sp);
  static var nw12 = normalWhiteTextStyle(12.sp);
  static var nw10 = normalWhiteTextStyle(10.sp);
}

/////
//Custom textStyle => Bold Black
TextStyle boldBlackTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
  );
}

//Custom textStyle => Normal black
TextStyle normalBlackTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );
}

//Custom textStyle => Bold White
TextStyle boldWhiteTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );
}

//Custom textStyle => Normal White
TextStyle normalWhiteTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );
}

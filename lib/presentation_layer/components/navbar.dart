// import 'package:single_salon/presentation_layer/screen/cart_screen/cart_screen.dart';
// import 'package:single_salon/presentation_layer/screen/account_screen/account_screen.dart';
// import 'package:single_salon/presentation_layer/screen/more_catogery/morecatogeryscreen.dart';
import 'package:single_salon/presentation_layer/components/appbar1.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';
// import 'package:single_salon/presentation_layer/screen/favorit_screen/favorit_screen.dart';
// import 'package:single_salon/presentation_layer/screen/homescreen/home_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:single_salon/presentation_layer/resources/strings_manager.dart';
import 'package:single_salon/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:single_salon/presentation_layer/screen/offer_screen/offer_screen.dart';
import 'package:single_salon/presentation_layer/screen/product_screen/product_screen.dart';
import 'package:single_salon/presentation_layer/screen/service_screen/service_screen.dart';
import 'package:single_salon/presentation_layer/screen/support_screen/support_problem_account_screen.dart';

int pageIndex = 2;

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    OfferScreen(),
    ServiceScreen(),
    ProductScreen(),
    SupportProblemScreen(),
  ];
  double high = 30;
  double size = 30;

  @override
  Widget build(BuildContext context) {
    String title = '';
    // void name() {
    // print(pageIndex);
    if (pageIndex == 2) {
      title = AppStrings.service.tr;
    } else if (pageIndex == 3) {
      title = AppStrings.product.tr;
    } else if (pageIndex == 4) {
      title = AppStrings.connect_with_us.tr;
    } else if (pageIndex == 0) {
      title = AppStrings.home.tr;
    } else if (pageIndex == 1) {
      title = AppStrings.offers.tr;
      ;
    }
    // }

    return Scaffold(
      appBar: appbarScreenWithdrawer(title),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgraound.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 60.0,
          items: <Widget>[
            Image.asset(
              'assets/icons/home.png',
              width: size,
              height: high,
              color: pageIndex == 0
                  ? ColorManager.background
                  : ColorManager.kTextblack,
            ),
            Image.asset(
              'assets/icons/discount.png',
              width: size,
              height: high,
              color: pageIndex == 1
                  ? ColorManager.background
                  : ColorManager.kTextblack,
            ),
            Image.asset(
              'assets/icons/massage.png',
              width: size,
              height: high,
              color: pageIndex == 2
                  ? ColorManager.background
                  : ColorManager.kTextblack,
            ),
            Image.asset(
              'assets/icons/bag.png',
              width: size,
              height: high,
              color: pageIndex == 3
                  ? ColorManager.background
                  : ColorManager.kTextblack,
            ),
            Image.asset(
              'assets/icons/send.png',
              width: size,
              height: high,
              color: pageIndex == 4
                  ? ColorManager.background
                  : ColorManager.kTextblack,
            ),
          ],
          color: ColorManager.kPrimary2,
          buttonBackgroundColor: Colors.grey,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(seconds: 1),
          onTap: (index) {
            // print(
            //   '$pageIndex : $index : ${sharedPreferences.getString('token')}',
            // );
            // if (index == 1 && sharedPreferences.getString('token') == null) {
            //   print('cccc');
            //   return aleartToken(context);
            // }s
            setState(() {
              pageIndex = index;
              print('$pageIndex : $index');
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(pageIndex),
      ),
    );
  }
}

// class CurvedNavigationBarCus extends StatefulWidget {
//   const CurvedNavigationBarCus({super.key});

//   @override
//   State<CurvedNavigationBarCus> createState() => _CurvedNavigationBarCusState();
// }

// class _CurvedNavigationBarCusState extends State<CurvedNavigationBarCus> {
//   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: CurvedNavigationBar(
//         key: _bottomNavigationKey,
//         index: 0,
//         height: 60.0,
//         items: <Widget>[
//           Icon(
//             Icons.settings,
//             color: ColorManager.kPrimary2,
//           ),
//           Image.asset(
//             'assets/icons/Wishlist.png',
//           ),
//           Image.asset(
//             'assets/icons/home.png',
//             color: ColorManager.kPrimary2,
//           ),
//           Image.asset(
//             'assets/icons/shopping.png',
//           ),
//           Icon(
//             Icons.category_outlined,
//             color: ColorManager.kPrimary2,
//           ),
//         ],
//         color: ColorManager.background,
//         buttonBackgroundColor: ColorManager.kPrimary,
//         backgroundColor: ColorManager.background,
//         animationCurve: Curves.easeInOut,
//         animationDuration: Duration(seconds: 1),
//         onTap: (index) {
//           print('$pageIndex : $index');
//           if (index == 1) {
//             Get.to(() => FavoritScreen());
//           } else if (index == 2) {
//             Get.to(() => HomeScreen());
//           } else if (index == 3) {
//             Get.to(() => CartScreen());
//           } else if (index == 4) {
//             Get.to(() => MoreCatogeryScreen());
//           } else if (index == 0) {
//             Get.to(() => AccountScreen());
//           }
//           setState(
//             () {
//               pageIndex = index;
//               print('$pageIndex : $index');
//             },
//           );
//         },
//         letIndexChange: (index) => true,
//       ),
//     );
//   }
// }

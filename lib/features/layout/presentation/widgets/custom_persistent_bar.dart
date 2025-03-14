// import 'package:evoluton_x/core/utils/app_colors.dart';
// import 'package:flutter/material.dart';


// class CustomPersistentTabView extends StatelessWidget {
//   final PersistentTabController controller;
//   final List<Widget> screens;
//   final List<PersistentBottomNavBarItem> navBarsItems;

//   final void Function(int)? onItemSelected;

//   const CustomPersistentTabView({
//     super.key,
//     required this.controller,
//     required this.screens,
//     required this.navBarsItems,
//     this.onItemSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: controller,
//       screens: screens,
//       items: navBarsItems,
//       confineToSafeArea: true,
//       navBarHeight: 55,
//       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       backgroundColor: AppColors.primaryColor,
//       handleAndroidBackButtonPress: true,
//       resizeToAvoidBottomInset: true,
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.circular(120),
//       ),
//       animationSettings: const NavBarAnimationSettings(
//         navBarItemAnimation: ItemAnimationSettings(
//           duration: Duration(milliseconds: 400),
//           curve: Curves.ease,
//         ),
//         screenTransitionAnimation: ScreenTransitionAnimationSettings(
//           animateTabTransition: true,
//           duration: Duration(milliseconds: 200),
//           screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
//         ),
//       ),
//       navBarStyle: NavBarStyle.style6,
//       onItemSelected: onItemSelected,
//     );
//   }
// }

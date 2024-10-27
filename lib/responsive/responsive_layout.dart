
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
 final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const ResponsiveLayout({super.key, required this.webScreenLayout, required this.mobileScreenLayout});
 

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
          if (constrains.maxWidth > 900) {
            //WEB
             return webScreenLayout;
          }
          //MOBILE
          return mobileScreenLayout;
      },
    );
  }
} 
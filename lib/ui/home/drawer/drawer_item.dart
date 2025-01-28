import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';

import '../../../utils/assets_manager.dart';

class DrawerItem extends StatelessWidget {
  DrawerItem({super.key,required this.title,required this.imgPath});
  String title;
  String imgPath;

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var screenHeight=852;
    var screenWidth=393;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Image.asset(imgPath,width: 24,height: 24,),
        ImageIcon(AssetImage(imgPath),color: AppColors.whiteColor,),
        SizedBox(width: width*(8/screenWidth),),
        Text(title,style: AppStyles.bold20White,),
      ],
    );
  }
}

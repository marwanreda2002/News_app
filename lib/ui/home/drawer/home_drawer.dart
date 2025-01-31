import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';

import '../../../utils/assets_manager.dart';
import 'drawer_item.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({required this.onGoToHomeClicked});

  Function onGoToHomeClicked;

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var screenHeight=852;
    var screenWidth=393;
    return Column(
      children: [
        Container(
          color: AppColors.whiteColor,
          height: height*(166/screenHeight),
          width: double.infinity,
          child: Center(
            child: Text("News App",style: AppStyles.bold24Black,),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 16,left: 8,right: 16),
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    onGoToHomeClicked();
                    Navigator.pop(context);
                  },
                  child: DrawerItem(
                    imgPath: AssetsManager.homeIcon,
                    title: "Go To Home",
                  )),
              SizedBox(height: height*(24/screenHeight),),
              Divider(
                color: AppColors.whiteColor,
                thickness: 1,
              ),
              SizedBox(height: height*(24/screenHeight),),
              DrawerItem(imgPath: AssetsManager.themeIcon, title: "Theme",),
              SizedBox(height: height*(8/screenHeight),),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.whiteColor,),
                  borderRadius: BorderRadius.all(Radius.circular(16),),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dark",style: AppStyles.medium20White,),
                    Icon(Icons.arrow_drop_down,size: 30,color: AppColors.whiteColor,)
                  ],
                ),
              ),
              SizedBox(height: height*(24/screenHeight),),
              Divider(
                color: AppColors.whiteColor,
                thickness: 1,
              ),
              SizedBox(height: height*(24/screenHeight),),
              DrawerItem(imgPath: AssetsManager.langIcon, title: "Language",),
              SizedBox(height: height*(8/screenHeight),),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.whiteColor,),
                  borderRadius: BorderRadius.all(Radius.circular(16),),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("English",style: AppStyles.medium20White,),
                    Icon(Icons.arrow_drop_down,size: 30,color: AppColors.whiteColor,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

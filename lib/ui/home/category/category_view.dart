import 'package:flutter/material.dart';
import 'package:news/model/category_card_model.dart';
import 'package:news/utils/app_colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryView extends StatelessWidget {
  CategoryView({required this.onViewAllClicked});

  Function onViewAllClicked;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var screenHeight = 852;
    var screenWidth = 393;
    List<CategoryCardModel> categoriesList =
        CategoryCardModel.getCategoriesList(false);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * (15 / screenWidth)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: height * (16 / screenHeight),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: height * (16 / screenHeight),
                );
              },
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Stack(
                    alignment: index % 2 == 0
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(categoriesList[index].imgPath)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * (16 / screenHeight),
                            horizontal: width * (16 / screenWidth)),
                        child: ToggleSwitch(
                          minWidth: width * (110 / screenWidth),
                          minHeight: height * (54 / screenHeight),

                          customWidths: [
                            width * (110 / screenWidth),
                            width * (54 / screenWidth)
                          ],
                          cornerRadius: 84.0,
                          activeBgColors: [
                            [AppColors.greyColor],
                            [Colors.transparent]
                          ],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          totalSwitches: 2,
                          customWidgets: [
                            Text(
                              'View All',
                              style: TextStyle(
                                color: Theme.of(context).indicatorColor,
                                fontSize: 24,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ],
                          // icons: [null, Icons.arrow_forward_ios],
                          onToggle: (index1) {
                            onViewAllClicked(categoriesList[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import '../utils/assets_manager.dart';

class CategoryCardModel {
  String id;
  String title;
  String imgPath;

  CategoryCardModel(
      {required this.title, required this.imgPath, required this.id});

  static List<CategoryCardModel> getCategoriesList(bool isDark) {
    return [
      CategoryCardModel(
          id: 'general',
          title: 'General',
          imgPath: isDark
              ? AssetsManager.generalDarkImage
              : AssetsManager.generalLightImage),
      CategoryCardModel(
          id: 'business',
          title: 'Business',
          imgPath: isDark
              ? AssetsManager.businessDarkImage
              : AssetsManager.businessLightImage),
      CategoryCardModel(
          id: 'sports',
          title: 'Sports',
          imgPath: isDark
              ? AssetsManager.sportsDarkImage
              : AssetsManager.sportsLightImage),
      CategoryCardModel(
          id: 'technology',
          title: 'Technology',
          imgPath: isDark
              ? AssetsManager.technologyDarkImage
              : AssetsManager.technologyLightImage),
      CategoryCardModel(
          id: 'entertainment',
          title: 'Entertainment',
          imgPath: isDark
              ? AssetsManager.entertainmentDarkImage
              : AssetsManager.entertainmentLightImage),
      CategoryCardModel(
          id: 'health',
          title: 'Health',
          imgPath: isDark
              ? AssetsManager.healthDarkImage
              : AssetsManager.healthLightImage),
      CategoryCardModel(
          id: 'science',
          title: 'Science',
          imgPath: isDark
              ? AssetsManager.scienceDarkImage
              : AssetsManager.scienceLightImage),
    ];
  }
}

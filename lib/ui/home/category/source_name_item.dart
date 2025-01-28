import 'package:flutter/material.dart';
import 'package:news/utils/app_styles.dart';

import '../../../model/SourceResponse.dart';

class SourceNameItem extends StatelessWidget {
  SourceNameItem({required this.source,super.key,required this.isSelected});
  Source source;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? "",
      style: isSelected?
      Theme.of(context).textTheme.labelLarge:
      Theme.of(context).textTheme.labelMedium,);
  }
}

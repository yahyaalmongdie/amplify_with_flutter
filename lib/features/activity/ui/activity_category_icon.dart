
import 'package:amplify_with_flutter/common/utils/colors.dart';
import 'package:amplify_with_flutter/models/ActivityCategory.dart';
import 'package:flutter/material.dart';

class ActivityCategoryIcon extends StatelessWidget {
  const ActivityCategoryIcon({
    required this.activityCategory,
    super.key,
  });
  final ActivityCategory activityCategory;

  @override
  Widget build(BuildContext context) {
    switch (activityCategory) {
      case ActivityCategory.Flight:
        return const Icon(
          Icons.flight,
          size: 50,
          color: Color(primaryColorDark),
        );

      case ActivityCategory.Lodging:
        return const Icon(
          Icons.hotel,
          size: 50,
          color: Color(primaryColorDark),
        );
      case ActivityCategory.Meeting:
        return const Icon(
          Icons.computer,
          size: 50,
          color: Color(primaryColorDark),
        );
      case ActivityCategory.Restaurant:
        return const Icon(
          Icons.restaurant,
          size: 50,
          color: Color(primaryColorDark),
        );
      default:
        ActivityCategory.Flight;
    }
    return const Icon(
      Icons.flight,
      size: 50,
      color: Color(primaryColorDark),
    );
  }
}

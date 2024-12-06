
import 'package:amplify_with_flutter/common/navigation/router/routes.dart';
import 'package:amplify_with_flutter/common/utils/colors.dart';
import 'package:amplify_with_flutter/models/Trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TripPageFloatingButton extends StatelessWidget {
  const TripPageFloatingButton({
    required this.trip,
    super.key,
  });

  final AsyncValue<Trip> trip;

  @override
  Widget build(BuildContext context) {
    switch (trip) {
      case AsyncData(:final value):
        return FloatingActionButton(
          onPressed: () {
            context.goNamed(
              AppRoute.addActivity.name,
              pathParameters: {'id': value.id},
            );
          },
          backgroundColor: const Color(primaryColorDark),
          child: const Icon(Icons.add),
        );

      case AsyncError():
        return const Placeholder();
      case AsyncLoading():
        return const SizedBox();

      case _:
        return const SizedBox();
    }
  }
}

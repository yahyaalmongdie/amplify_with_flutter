
import 'package:amplify_with_flutter/features/activity/controller/activities_list_controller.dart';
import 'package:amplify_with_flutter/features/activity/ui/activities_list/activities_timeline.dart';
import 'package:amplify_with_flutter/models/Trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivitiesList extends ConsumerWidget {
  const ActivitiesList({
    required this.trip,
    super.key,
  });
  final Trip trip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activitiesListValue =
        ref.watch(activitiesListControllerProvider(trip.id));
    switch (activitiesListValue) {
      case AsyncData(:final value):
        return value.isEmpty
            ? const Center(
                child: Text('No Activities'),
              )
            : ActivitiesTimeline(activities: value);

      case AsyncError():
        return const Center(
          child: Text('Error'),
        );
      case AsyncLoading():
        return const Center(
          child: CircularProgressIndicator(),
        );

      case _:
        return const Center(
          child: Text('Error'),
        );
    }
  }
}

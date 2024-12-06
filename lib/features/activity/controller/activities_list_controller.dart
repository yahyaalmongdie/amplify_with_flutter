import 'dart:async';

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_with_flutter/common/utils/date_time_formatter.dart';
import 'package:amplify_with_flutter/features/activity/data/activities_repository.dart';
import 'package:amplify_with_flutter/models/Activity.dart';
import 'package:amplify_with_flutter/models/ActivityCategory.dart';
import 'package:amplify_with_flutter/models/Trip.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activities_list_controller.g.dart';

@riverpod
class ActivitiesListController extends _$ActivitiesListController {
  Future<List<Activity>> _fetchActivities(String tripId) async {
    final activitiesRepository = ref.read(activitiesRepositoryProvider);
    final activities = await activitiesRepository.getActivitiesForTrip(tripId);
    return activities;
  }

  @override
  FutureOr<List<Activity>> build(String tripId) async {
    return _fetchActivities(tripId);
  }

  Future<void> removeActivity(Activity activity) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final activitiesRepository = ref.read(activitiesRepositoryProvider);
      await activitiesRepository.delete(activity);

      return _fetchActivities(activity.trip.id);
    });
  }

  Future<void> add({
    required String name,
    required String activityDate,
    required TimeOfDay activityTime,
    required ActivityCategory category,
    required Trip trip,
  }) async {
    final now = DateTime.now();
    final time = DateTime(
      now.year,
      now.month,
      now.day,
      activityTime.hour,
      activityTime.minute,
    );

    final activity = Activity(
      activityName: name,
      activityDate: TemporalDate(DateTime.parse(activityDate)),
      activityTime: TemporalTime.fromString(time.format('HH:mm:ss.sss')),
      trip: trip,
      category: category,
    );
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final activitiesRepository = ref.read(activitiesRepositoryProvider);

      await activitiesRepository.add(activity);

      return _fetchActivities(trip.id);
    });
  }
}

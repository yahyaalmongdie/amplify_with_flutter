import 'dart:async';


import 'package:amplify_with_flutter/features/trip/data/trips_repository.dart';
import 'package:amplify_with_flutter/models/Trip.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'past_trips_list_controller.g.dart';

@riverpod
class PastTripsListController extends _$PastTripsListController {
  Future<List<Trip>> _fetchTrips() async {
    final tripsRepository = ref.read(tripsRepositoryProvider);
    final trips = await tripsRepository.getPastTrips();
    return trips;
  }

  @override
  FutureOr<List<Trip>> build() async {
    return _fetchTrips();
  }
}

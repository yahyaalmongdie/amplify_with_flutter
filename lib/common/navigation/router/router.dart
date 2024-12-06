import 'package:amplify_with_flutter/common/navigation/router/routes.dart';
import 'package:amplify_with_flutter/features/trip/ui/edit_trip_page/edit_trip_page.dart';
import 'package:amplify_with_flutter/features/trip/ui/past_trip_page/past_trip_page.dart';
import 'package:amplify_with_flutter/features/trip/ui/pats_trip/past_trips_list.dart';
import 'package:amplify_with_flutter/features/trip/ui/trip_page/trip_page.dart';
import 'package:amplify_with_flutter/features/trip/ui/trip_list/trips_list_page.dart';
import 'package:amplify_with_flutter/models/Trip.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const TripsListPage(),
    ),
    GoRoute(
      path: '/trip/:id',
      name: AppRoute.trip.name,
      builder: (context, state) {
        final tripId = state.pathParameters['id']!;
        return TripPage(tripId: tripId);
      },
    ),
    GoRoute(
      path: '/edittrip/:id',
      name: AppRoute.editTrip.name,
      builder: (context, state) {
        return EditTripPage(
          trip: state.extra! as Trip,
        );
      },
    ),
        GoRoute(
      path: '/pasttrips',
      name: AppRoute.pastTrips.name,
      builder: (context, state) => const PastTripsList(),
    ),
        GoRoute(
      path: '/pasttrip/:id',
      name: AppRoute.pastTrip.name,
      builder: (context, state) {
        final tripId = state.pathParameters['id']!;
        return PastTripPage(tripId: tripId);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);

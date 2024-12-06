
import 'package:amplify_with_flutter/common/ui/the_navigation_drawer.dart';
import 'package:amplify_with_flutter/common/utils/colors.dart';
import 'package:amplify_with_flutter/features/trip/controller/past_trips_list_controller.dart';
import 'package:amplify_with_flutter/features/trip/ui/trips_gridview/trips_list_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PastTripsList extends ConsumerWidget {
  const PastTripsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsListValue = ref.watch(pastTripsListControllerProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Amplify Trips Planner',
        ),
        backgroundColor:  Color(primaryColorDark),
      ),
      drawer: const TheNavigationDrawer(),
      body: TripsListGridView(
        tripsList: tripsListValue,
        isPast: true,
      ),
    );
  }
}

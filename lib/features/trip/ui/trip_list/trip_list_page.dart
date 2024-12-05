import 'package:amplify_with_flutter/common/ui/the_navigation_drawer.dart';
import 'package:amplify_with_flutter/common/utils/colors.dart';
import 'package:amplify_with_flutter/features/trip/controller/trips_list_controller.dart';
import 'package:amplify_with_flutter/features/trip/ui/trip_list/add_trip_bottomsheet.dart';
import 'package:amplify_with_flutter/features/trip/ui/trips_gridview/trips_list_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class TripsListPage extends StatelessWidget {
//   const TripsListPage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Amplify Trips Planner',
//         ),
//         backgroundColor: Color(primaryColorDark),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//               isScrollControlled: true,
//               shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(16),
//                       topRight: Radius.circular(16))),
//               context: context,
//               builder: (context) {
//                 return AddTripBottomSheet();
//               });
//         },
//         backgroundColor: Color(primaryColorDark),
//         child: const Icon(Icons.add),
//       ),
//       body: const Center(
//         child: Text('Trips List'),
//       ),
//     );
//   }
// }


class TripsListPage extends ConsumerWidget {
  const TripsListPage({
    super.key,
  });

  Future<void> showAddTripDialog(BuildContext context) =>
      showModalBottomSheet<void>(
        isScrollControlled: true,
        elevation: 5,
        context: context,
        builder: (sheetContext) {
          return const AddTripBottomSheet();
        },
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsListValue = ref.watch(tripsListControllerProvider);
    return Scaffold(
      drawer: const TheNavigationDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Amplify Trips Planner',
        ),
        backgroundColor: const Color(primaryColorDark),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTripDialog(context);
        },
        backgroundColor: const Color(primaryColorDark),
        child: const Icon(Icons.add),
      ),
      body: TripsListGridView(
        tripsList: tripsListValue,
      ),
    );
  }
}
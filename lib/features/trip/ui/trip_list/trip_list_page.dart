import 'package:amplify_with_flutter/common/utils/colors.dart';
import 'package:amplify_with_flutter/features/trip/ui/trip_list/add_trip_bottomsheet.dart';
import 'package:flutter/material.dart';

class TripsListPage extends StatelessWidget {
  const TripsListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Amplify Trips Planner',
        ),
        backgroundColor: Color(primaryColorDark),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              context: context,
              builder: (context) {
                return AddTripBottomSheet();
              });
        },
        backgroundColor: Color(primaryColorDark),
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text('Trips List'),
      ),
    );
  }
}

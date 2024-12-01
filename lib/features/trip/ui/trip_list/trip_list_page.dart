import 'package:amplify_with_flutter/common/utils/colors.dart';
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
        backgroundColor:  Color(primaryColorDark),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor:  Color(primaryColorDark),
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text('Trips List'),
      ),
    );
  }
}

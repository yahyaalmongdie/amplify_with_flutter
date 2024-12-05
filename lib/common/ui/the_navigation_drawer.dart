import 'package:amplify_with_flutter/common/navigation/router/routes.dart';
import 'package:amplify_with_flutter/common/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TheNavigationDrawer extends ConsumerWidget {
  const TheNavigationDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(primaryColorDark),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'Amplify Trips Planner',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Trips'),
            onTap: () {
              context.goNamed(
                AppRoute.home.name,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Past Trips'),
            onTap: () {
              context.goNamed(
                AppRoute.pastTrips.name,
              );
            },
          ),
        ],
      ),
    );
  }
}

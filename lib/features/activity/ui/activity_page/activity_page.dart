import 'package:amplify_with_flutter/common/utils/colors.dart';
import 'package:amplify_with_flutter/features/activity/controller/activity_controller.dart';
import 'package:amplify_with_flutter/features/activity/ui/activity_page/activity_listview.dart';
import 'package:amplify_with_flutter/features/activity/ui/activity_page/activity_page_appbar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivityPage extends ConsumerWidget {
  const ActivityPage({
    required this.activityId,
    super.key,
  });

  final String activityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityValue = ref.watch(activityControllerProvider(activityId));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Amplify Trips Planner',
        ),
        leading: ActivityPageAppBarIcon(
          activity: activityValue,
        ),
        backgroundColor: const Color(primaryColorDark),
      ),
      body: ActivityListView(
        activity: activityValue,
      ),
    );
  }
}

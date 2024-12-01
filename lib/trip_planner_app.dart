import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_with_flutter/common/navigation/router/router.dart';
import 'package:amplify_with_flutter/common/utils/colors.dart';
import 'package:flutter/material.dart';

class TripsPlannerApp extends StatelessWidget {
  const TripsPlannerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp.router(
        routerConfig: router,
        builder: Authenticator.builder(),
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: primaryColor)
                  .copyWith(
            background: const Color(0xff82CFEA),
          ),
        ),
      ),
    );
  }
}

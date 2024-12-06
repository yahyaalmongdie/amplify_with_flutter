
import 'package:amplify_with_flutter/common/utils/colors.dart';
import 'package:amplify_with_flutter/models/Trip.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SelectedPastTripCard extends StatelessWidget {
  const SelectedPastTripCard({
    required this.trip,
    super.key,
  });

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            trip.tripName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            alignment: Alignment.center,
            color: const Color(primaryColorDark),
            height: 150,
            child: trip.tripImageUrl != null
                ? Stack(
                    children: [
                      const Center(child: CircularProgressIndicator()),
                      CachedNetworkImage(
                        imageUrl: trip.tripImageUrl!,
                        cacheKey: trip.tripImageKey,
                        width: double.maxFinite,
                        height: 500,
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fill,
                      ),
                    ],
                  )
                : Image.asset(
                    'images/amplify.png',
                    fit: BoxFit.contain,
                  ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/customer.home/modules/distance.dart';
import 'package:pattern_m/src/modules/customer.home/modules/rider_list.dart';
import 'package:pattern_m/src/utils/style.dart';

import '../provider/home.provider.dart';

class LookingForRiders extends ConsumerWidget {
  const LookingForRiders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Looking for Riders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Pickup',
                  style: medium,
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: TextField(
                    controller: ref.watch(
                      textControllerProvider('pickUpLocation'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Delivery',
                  style: medium,
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: TextField(
                    controller: ref.watch(
                      textControllerProvider('deliveryLocation'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: const GoogleMapviewTwoPoints(),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Looking For Aviable Drivers',
              style: interBold,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RidersList()),
                  );
                },
                child: const Text('Next Page'))
          ],
        ),
      ),
    );
  }
}

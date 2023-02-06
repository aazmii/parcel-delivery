import 'package:flutter/material.dart';

import 'package:pattern_m/src/components/information/information_card.dart';
import 'package:pattern_m/src/components/map/googlemap_view.dart';
import 'package:pattern_m/src/modules/ScreenSize/small_screen.dart';
import 'package:pattern_m/src/utils/style.dart';

class CustomerDetailsPage extends StatelessWidget {
  const CustomerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final temp = MediaQuery.of(context).size.width;
    return temp > 350
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Customer Details'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const InfromationCard(
                        name: 'Person name', number: '01557038556'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Pickup Location',
                      style: interBold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'You are 7 min away ',
                          style: medium,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const GoogleMapView(heightSize: 200),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Delivery Location',
                      style: interBold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'You are 30 min away ',
                          style: medium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const GoogleMapView(heightSize: 200),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Service Charge will be ',
                          style: medium,
                        ),
                        Text(
                          ' 200 taka',
                          style: moneyValue,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Confirm'))
                  ],
                ),
              ),
            ),
          )
        : const SmallScreenSize();
  }
}

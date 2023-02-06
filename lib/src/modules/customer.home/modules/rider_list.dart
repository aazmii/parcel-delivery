import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/style.dart';
import '../provider/home.provider.dart';
import 'distance.dart';

class RidersList extends ConsumerWidget {
  const RidersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rider List'),
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
              height: 20,
            ),
            SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: const GoogleMapviewTwoPoints(),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 120,
                  child: InkWell(
                    onTap: () {},
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                    'assets/images/flutter_logo.png'),
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shakhawat Hossain',
                                    style: medium,
                                  ),
                                  Text(
                                    '3 min away',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  RatingBar.builder(
                                    itemSize: 20,
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  )
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

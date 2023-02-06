import 'package:flutter/material.dart';
import 'package:pattern_m/src/modules/ScreenSize/small_screen.dart';

import '../../../components/map/googlemap_view.dart';
import '../../../utils/style.dart';
import '../modules/view/customer_details.dart';

class DeliveryManHomeView extends StatelessWidget {
  const DeliveryManHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final temp = MediaQuery.of(context).size.width;
    return temp > 350
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Delivery man Serviec'),
            ),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            'Pickup Location',
                            style: interBold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                              'address road-20,house-9,avenue-3,Dhaka-1216'),
                          const SizedBox(
                            height: 10,
                          ),
                          const GoogleMapView(
                            heightSize: 120,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                'you are 5 min away ',
                                textAlign: TextAlign.end,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Deliver Location',
                            style: interBold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                              'address road-20,house-9,avenue-3,Dhaka-1216'),
                          const SizedBox(
                            height: 10,
                          ),
                          const GoogleMapView(
                            heightSize: 120,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                'you are 25 min away ',
                                textAlign: TextAlign.end,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Service charge will be ',
                                style: medium,
                              ),
                              Text(
                                ' 200 tk',
                                style: moneyValue,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 25,
                            width: 125,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CustomerDetailsPage()),
                                );
                              },
                              child: const Text('Pick'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        : const SmallScreenSize();
  }
}

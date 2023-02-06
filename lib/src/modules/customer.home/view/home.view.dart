import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pattern_m/src/constants/constants.dart';

import 'package:pattern_m/src/modules/ScreenSize/small_screen.dart';
import 'package:pattern_m/src/modules/customer.home/components/dropdown/dropdown.dart';
import 'package:pattern_m/src/modules/customer.home/modules/google_map.dart';
import 'package:pattern_m/src/modules/customer.home/provider/home.provider.dart';

import '../find_deliveryMan/view/find_deliveryman.dart';
import '../modules/distance.dart';
import '../provider/functions.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  static const List<String> listItems = <String>[
    'dhaka',
    'khulna',
    'barishal',
    'ctg',
    'mirpur',
    'gulshan',
    'dhanmondi',
    'rajshahi'
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temp = MediaQuery.of(context).size.width;

    return temp > 350
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Delivery Service'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const Text('Where I am'),
                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Pickup Location'),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    TextField(
                      controller: ref.watch(
                        textControllerProvider('pickUpLocation'),
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Pickup Location',
                        hintText: 'Pickup Location',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: const [
                    //     Text('Or Pickup Location from map'),
                    //   ],
                    // ),

                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GoogleMapTest(
                                  latlangProvider:
                                      googleMapLatLngProviderPickup,
                                  textEditingController: ref.watch(
                                    textControllerProvider('pickUpLocation'),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.map),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Pick location from google map'),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Autocomplete<String>(
                    //   // fieldViewBuilder: (context, textEditingController,
                    //   //     focusNode, onFieldSubmitted) {
                    //   //   return TextFormField(
                    //   //     initialValue: 'dhaka',
                    //   //     decoration: const InputDecoration(
                    //   //         hintText: 'Where i am', labelText: 'Where i am'),
                    //   //   );
                    //   // },
                    //   initialValue: const TextEditingValue(
                    //     text: 'dhaka',
                    //   ),
                    //   optionsBuilder: (TextEditingValue textEditingValue) {
                    //     if (textEditingValue.text == '') {
                    //       return const Iterable<String>.empty();
                    //     }

                    //     return listItems.where(
                    //       (String element) {
                    //         return element
                    //             .contains(textEditingValue.text.toLowerCase());
                    //       },
                    //     );
                    //   },
                    //   onSelected: (String element) {
                    //     print('the $element was selected');
                    //   },
                    // ),
                    const SizedBox(
                      height: 10,
                    ),

                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) =>
                    //               const DistanceBetweenTwoPoints()),
                    //     );

                    //     //placeAutocomplete('Dhaka');

                    //     //PlaceApis().searchPredictions('Dhaka');
                    //   },
                    //   child: const Text('response'),
                    // ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ElevatedButton(
                    //       onPressed: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => GoogleMapTest(
                    //                 textEditingController: ref.read(
                    //                     textControllerProvider(
                    //                         'googleMapDatawhereIam'))),
                    //           ),
                    //         );
                    //       },
                    //       child: Row(
                    //         children: const [
                    //           Icon(Icons.map),
                    //           SizedBox(
                    //             width: 10,
                    //           ),
                    //           Text('Pick location from google map'),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    //const LocationMapCard(),

                    // ElevatedButton(
                    //   onPressed: () async {},
                    //   child: const Text('test'),
                    // ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: const [
                    //     Text('Give your address '),
                    //   ],
                    // ),

                    // //const DropDownTest(),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: const [
                    //     Text('or choose location from google map'),
                    //   ],
                    // ),

                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Delivery location'),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    TextField(
                      controller: ref.watch(
                        textControllerProvider('deliveryLocation'),
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Delivery location ',
                        hintText: 'Dellivery location ',
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: const [
                    //     Text('Or Pick delivery Location from map'),
                    //   ],
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GoogleMapTest(
                                  latlangProvider:
                                      googleMapLatLngProviderDelivery,
                                  textEditingController: ref.watch(
                                    textControllerProvider('deliveryLocation'),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.map),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Pick location from google map'),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //const LocationMapCard(),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width - 30,
                      child: const TextField(
                        maxLines: 7,
                        decoration: InputDecoration(
                          isDense: true,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DistanceBetweenTwoPoints()),
                              );
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        : const SmallScreenSize();
  }
}

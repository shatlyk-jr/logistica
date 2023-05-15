import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistica/appointment/constants.dart';

import 'logistic_filter_widget.dart';

class LogisticBodyWidget extends StatelessWidget {
  const LogisticBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Gelýänler",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[200]!,
                ),
                borderRadius: BorderRadius.circular(4)),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      backgroundColor: kIndigoDark,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "Arassa miti",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Details",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            const Text('5t'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Goşmaça",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 58,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Container(
                        width: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("95 Benzin - 15t"),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.local_gas_station,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Motiva",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Gatnaw ugry",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[200]!,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  width: MediaQuery.of(context).size.width - 32,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: kIndigoDark,
                                width: 3,
                              ),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const CircleAvatar(
                              backgroundColor: kIndigoDark,
                            ),
                          ),
                          const Flexible(
                            child: DottedLine(
                              // dashGapLength: 8,
                              // lineLength: ,
                              direction: Axis.vertical,
                              dashColor: Colors.grey,
                              lineThickness: 2,
                              dashGapLength: 4,
                              dashLength: 8,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: kIndigoDark,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text("1"),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  "Gatnaw ugry: Aşgabat - Mary",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: const [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: kIndigoDark,
                                  foregroundColor: Colors.white,
                                  child: Icon(
                                    Icons.route,
                                    size: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Text(
                                    "Volvo",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 84,
                  width: MediaQuery.of(context).size.width - 32,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: kIndigoDark,
                                width: 3,
                              ),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const CircleAvatar(
                              backgroundColor: kIndigoDark,
                            ),
                          ),
                          // Flexible(
                          //   child: DottedLine(
                          //     // dashGapLength: 8,
                          //     // lineLength: ,
                          //     direction: Axis.vertical,
                          //     dashColor: Colors.grey,
                          //     lineThickness: 2,
                          //     dashGapLength: 4,
                          //     dashLength: 8,
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: kIndigoDark,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text("2"),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  "Ýük menzili: Balkan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: const [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: kIndigoDark,
                                  foregroundColor: Colors.white,
                                  child: Icon(
                                    Icons.route,
                                    size: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Text(
                                    "127 Train",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Consumer(builder: (context, ref, _) {
            final open = ref.watch(isFilterOpen);
            return GestureDetector(
              onTap: () {
                ref.read(isFilterOpen.notifier).state = !open;
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: kIndigoDark,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Gatnawy görkez",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.car_crash_outlined,
                      size: 12,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}

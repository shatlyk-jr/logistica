import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final isFilterOpen = StateProvider<bool>((ref) => false);

class LogisticFilterWidget extends StatelessWidget {
  const LogisticFilterWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final open = ref.watch(isFilterOpen);
      return AnimatedContainer(
        height: open ? 204 : 0,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInCubic,
        decoration: BoxDecoration(
          color: Colors.grey[50],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Date",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: const [
                      Icon(Icons.calendar_month_outlined),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Jan 6, 2023",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Tractor ID",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Container(
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.fire_truck_outlined),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "18V",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Tractor ID",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: const [
                      Icon(Icons.fire_truck_outlined),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "18V",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

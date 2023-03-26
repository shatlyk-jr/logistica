import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'logistic_filter_widget.dart';

class LogisticTopBarWidget extends StatelessWidget {
  const LogisticTopBarWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 8,
        bottom: 16,
        top: 16,
      ),
      child: Row(
        children: [
          const Text(
            "Shipping",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 6,
            backgroundColor: Colors.blueGrey[800],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_list,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:logistica/appointment/constants.dart';

class AppointmentCard extends StatelessWidget {
  final double padding;
  final bool isActive;
  final String name;
  final String dateTime;

  const AppointmentCard(
      {required this.padding,
      this.isActive = false,
      required this.name,
      required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        margin: EdgeInsets.symmetric(horizontal: padding),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: kBlueColor,
                    foregroundColor: Colors.white,
                    child: Text(
                      name.substring(0, 2).toUpperCase(),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 2,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor:
                            isActive ? Colors.green[700] : Colors.transparent,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: kIndigoDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      dateTime,
                      style: const TextStyle(
                        color: kIndigoLight,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.more_vert,
                color: kIndigoDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

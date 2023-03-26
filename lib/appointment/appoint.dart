// ignore_for_file: ary_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:logi/appointment/components/appointment_card.dart';
import 'package:logi/appointment/constants.dart';
import 'package:logi/appointment/pages/appointment_request_page.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage();

  @override
  AppointmentPageState createState() => AppointmentPageState();
}

class AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF3F6FF),
        iconTheme: const IconThemeData(
          color: kIndigoDark,
        ),
        elevation: 0,
        leading: const Icon(Icons.drag_handle),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.calendar_today),
          ),
        ],
      ),
      backgroundColor: const Color(0xffF3F6FF),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _buildHeaderSection(),
          ),
          SliverToBoxAdapter(
            child: _buildAppointmentRequestSection(),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 8),
              child: Text(
                "Next Appointments",
                style: TextStyle(color: kIndigoLight, fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const AppointmentCard(
                  name: "Ashyr Metallurg",
                  dateTime: "09 Jan 2023, 8am - 10am",
                  padding: 16,
                ),
                const AppointmentCard(
                  name: "Merdan Fisher",
                  dateTime: "17 Jan 2023, 11am - 02pm",
                  padding: 16,
                ),
                const AppointmentCard(
                  name: "Batyr Dealer",
                  dateTime: "23 Jan 2023, 8am - 10am",
                  padding: 16,
                ),
                const AppointmentCard(
                  name: "Geldimyrat Shipper",
                  dateTime: "26 Jan 2023, 9am - 10am",
                  padding: 16,
                ),
                const AppointmentCard(
                  name: "Yakup Truck",
                  dateTime: "02 Feb 2023, 11am - 02pm",
                  padding: 16,
                ),
                const AppointmentCard(
                  name: "Nowruz GAP Inshaat",
                  dateTime: "10 Feb 2023, 9am - 10am",
                  padding: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28, top: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Welcome Back!",
            style: TextStyle(
              color: kIndigoLight,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "Mr Annagurban",
            style: TextStyle(
              color: kIndigoDark,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentRequestSection() {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const AppointmentRequestPage()));
      },
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
        elevation: 8,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16),
                color: kBlueColor,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Appointment Request",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[300],
                          ),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.grey[300],
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.watch_later,
                          color: Colors.grey[100],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "12 Jan 2023, 8am - 10am",
                          style: TextStyle(
                            color: Colors.grey[100],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Hero(
                            tag: 1,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(16)),
                              child: Image.asset(
                                'images/ed.png',
                                height: 56,
                                width: 56,
                                fit: BoxFit.fill,
                              ),
                            )),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Mr Batyr",
                                style: TextStyle(
                                    color: kIndigoDark, fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Official dealer",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.info_outline,
                          color: kBlueColor,
                          size: 25,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: kBlueColor,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                              ),
                              child: const Text("ACCEPT"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey[700],
                                backgroundColor: Colors.grey[300],
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                              ),
                              child: const Text(
                                "DECLINE",
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

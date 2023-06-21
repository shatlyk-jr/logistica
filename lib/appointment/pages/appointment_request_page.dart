import '../constants.dart';
import 'package:flutter/material.dart';

class AppointmentRequestPage extends StatelessWidget {
  const AppointmentRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        leading: const BackButton(),
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          _buildBackground(context),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.27,
            left: 40,
            child: _buildContentUI(),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(112)),
            color: kBlueColor,
          ),
          height: MediaQuery.of(context).size.height * 0.35,
          child: const Center(
            child: Text(
              "12 Jan 2023, \n8am - 10 am",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Batyr Geldiyev",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 46,
                        color: kIndigoDark,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Dealer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 46,
                        color: kIndigoDark,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Comment",
                      style: TextStyle(
                        color: kIndigoLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Hello Mr. Annagurban, I am going to bring my complete history check of sold papers with me",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    _buildDocumentAttachmentWidget(),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildContentUI() {
    return Row(
      children: <Widget>[
        Hero(
          tag: 1,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: Image.asset(
                'images/ed.png',
                //2023-01-15-16-41-53.png
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            radius: 35,
            foregroundColor: Colors.white,
            backgroundColor: kBlueLight,
            child: Icon(Icons.call),
          ),
        ),
      ],
    );
  }

  Widget _buildDocumentAttachmentWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 70,
      color: const Color(0xffE7F8FA),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 3,
            color: kBlueLight,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Transform.rotate(
              angle: 3.14 / 180 * 45,
              child: const Icon(
                Icons.attach_file,
                color: kBlueLight,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Complete history checked",
                style: TextStyle(
                  fontSize: 18,
                  color: kIndigoDark,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "05 Nov 2022",
                style: TextStyle(
                  fontSize: 16,
                  color: kIndigoLight,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

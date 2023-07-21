import 'package:bci/screens/members/bus/buscommenappbar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constands/constands.dart';

class BusContactDetails extends StatelessWidget {
  const BusContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: const PreferredSize(
          preferredSize: const Size.fromHeight(220), child: ComenAppbar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ksizedbox20,
              const Text('Contact Details').text.xl.semiBold.make(),
              ksizedbox10,
              const Text('EMAIL ID').text.bold.gray500.make(),
              ksizedbox10,
              const Text('Pravinraj902527@gmail.com').text.sm.gray500.make(),
              ksizedbox10,
              Divider(color: kgrey, height: 0.5),
              ksizedbox20,
              const Text('PHONE').text.bold.gray500.make(),
              ksizedbox10,
              const Text('+91 - 9789390456').text.sm.gray500.make(),
              ksizedbox10,
              Divider(color: kgrey, height: 0.5),
              ksizedbox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Passenger Details').text.xl.semiBold.make(),
                  Text('Seat No : 07').text.semiBold.make(),
                ],
              ),
              ksizedbox10,
              const Text('NAME').text.bold.gray500.make(),
              ksizedbox10,
              const Text('Praveen').text.sm.gray500.make(),
              ksizedbox10,
              Divider(color: kgrey, height: 0.5),
              ksizedbox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('GENDER').text.gray500.semiBold.make(),
                  Text('Male').text.semiBold.gray500.make(),
                  Text('Female').text.semiBold.gray500.make(),
                ],
              ),
              ksizedbox10,
              const Text('AGE').text.bold.gray500.make(),
              ksizedbox10,
              const Text('21').text.sm.gray500.make(),
              ksizedbox10,
              Divider(color: kgrey, height: 0.5),
              ksizedbox10,
              ksizedbox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Passenger Details').text.xl.semiBold.make(),
                  Text('Seat No : 07').text.semiBold.make(),
                ],
              ),
              ksizedbox10,
              const Text('NAME').text.bold.gray500.make(),
              ksizedbox10,
              const Text('Praveen').text.sm.gray500.make(),
              ksizedbox10,
              Divider(color: kgrey, height: 0.5),
              ksizedbox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('GENDER').text.gray500.semiBold.make(),
                  Text('Male').text.semiBold.gray500.make(),
                  Text('Female').text.semiBold.gray500.make(),
                ],
              ),
              ksizedbox10,
              const Text('AGE').text.bold.gray500.make(),
              ksizedbox10,
              const Text('21').text.sm.gray500.make(),
              ksizedbox10,
              Divider(color: kgrey, height: 0.5),
              ksizedbox10,
              ksizedbox20,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Container(child:Center(child: Text('Cancel')) ,
                   //   width: double.infinity,
              height: 75,
              color: kgrey,
            ),
          ),
          Expanded(
            child: Container(child: Center(child: Text('Continue Booking')),
                //      width: double.infinity,
              height: 75,
              color: korange,
            ),
          ),
        ],
      ),
    );
  }
}

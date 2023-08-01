import 'package:bci/controllers/bus_controllers.dart';
import 'package:bci/models/bus_booking_models/bus_contact_details_model.dart';
import 'package:bci/models/bus_booking_models/pax_list_model.dart';
import 'package:bci/models/bus_booking_models/search_bus_model.dart';
import 'package:bci/screens/members/bus/buscommenappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constands/constands.dart';

class BusContactDetails extends StatefulWidget {
  Bus busData;
  String boardingId;
  String dropingId;
  String searchkey;
  List<String> seatIds;
  List<BusContactDetailsModel> busContactmodel;
  String amount;
  String cusName;

  BusContactDetails(
      {super.key,
      required this.boardingId,
      required this.busData,
      required this.dropingId,
      required this.searchkey,
      required this.amount,
      required this.seatIds,
      required this.busContactmodel,
      required this.cusName
      });

  @override
  State<BusContactDetails> createState() => _BusContactDetailsState();
}

class _BusContactDetailsState extends State<BusContactDetails> {

 final busController = Get.find<BusController>();

  var phoneNumberController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  String selectedGender = '';
  //2
  var phoneNumberController2 = TextEditingController();
  var nameController2 = TextEditingController();
  var emailController2 = TextEditingController();
  var ageController2 = TextEditingController();
  String selectedGender2 = '';
  //3
  var phoneNumberController3 = TextEditingController();
  var nameController3 = TextEditingController();
  var emailController3 = TextEditingController();
  var ageController3 = TextEditingController();
  String selectedGender3 = '';
  //4
  var phoneNumberController4 = TextEditingController();
  var nameController4 = TextEditingController();
  var emailController4 = TextEditingController();
  var ageController4 = TextEditingController();
  String selectedGender4 = '';
  //5
  var phoneNumberController5 = TextEditingController();
  var nameController5 = TextEditingController();
  var emailController5 = TextEditingController();
  var ageController5 = TextEditingController();
  String selectedGender5 = '';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(220), child: ComenAppbar()),
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
               TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration.collapsed(hintText: "Enter your email"),
              ),
              ksizedbox10,
              Divider(color: kgrey, height: 0.5),
              ksizedbox20,
              const Text('PHONE').text.bold.gray500.make(),
              ksizedbox10,
               TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                       LengthLimitingTextInputFormatter(10),
                       FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                controller: phoneNumberController,
                decoration: const InputDecoration.collapsed(hintText: "Enter your phone"),
              ),
              ksizedbox10,
              Divider(color: kgrey, height: 0.5),
              ksizedbox20,
              for (int i = 0; i < widget.busContactmodel.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Passenger Details').text.xl.semiBold.make(),
                        Text('Seat No : ${widget.busContactmodel[i].seats}')
                            .text
                            .semiBold
                            .make(),
                      ],
                    ),
                    ksizedbox10,
                    const Text('NAME').text.bold.gray500.make(),
                    ksizedbox10,
                    TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      controller: widget.busContactmodel[i].nameController,
                      decoration: const InputDecoration.collapsed(
                          hintText: "Enter your name"),
                    ),
                    ksizedbox10,
                    Divider(color: kgrey, height: 0.5),
                    ksizedbox20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('GENDER').text.gray500.semiBold.make(),
                      ],
                    ),
                    RadioListTile(
            title:const Text('Male'),
            value: 'Male',
            groupValue: widget.busContactmodel[i].gender,
            onChanged: (value) {
              setState(() {
                widget.busContactmodel[i].gender = value!;
              });
            },
          ),
          RadioListTile(
            title:const Text('Female'),
            value: 'Female',
            groupValue: widget.busContactmodel[i].gender,
            onChanged: (value) {
              setState(() {
                widget.busContactmodel[i].gender = value!;
              });
            },
          ),
                    ksizedbox10,
                    const Text('AGE').text.bold.gray500.make(),
                    ksizedbox10,
                    TextField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      controller: widget.busContactmodel[i].ageController,
                      decoration: const InputDecoration.collapsed(hintText: "Enter your age"),
                    ),
                    ksizedbox10,
                    Divider(color: kgrey, height: 0.5),
                    ksizedbox10,
                    ksizedbox20,
                  ],
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                child: Center(child: Text('Cancel',style: TextStyle(color: Colors.white))),
                //   width: double.infinity,
                height: 55,
                color: kgrey,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {

                List<PaxDetailslist> paxDetailslists = [];

                for(int a = 0; a < widget.busContactmodel.length; a++){
                 
                 PaxDetailslist paxDetailslistdata = PaxDetailslist(
                  age: widget.busContactmodel[a].ageController.text,
                  gender:widget.busContactmodel[a].gender == "Male" ? 0 : 1, 
                  isLadies: false, 
                  paxName: widget.busContactmodel[a].nameController.text, 
                  seatNumber: widget.busContactmodel[a].seats
                  ); 

                  paxDetailslists.add(paxDetailslistdata);

                }


                busController.tempBookBusTicket(
                    boardingId: widget.boardingId,
                    droppingId: widget.dropingId,
                    busData: widget.busData,
                    searcKey: widget.searchkey,
                    mobileNumber: phoneNumberController.text,
                    customerEmail: emailController.text,
                    paxDetailslist: paxDetailslists,
                    amount: widget.amount,
                    customerName: widget.cusName,
                    seatMapKey: busController.seatMapKey.value);
              },
              child: Container(
                child: Center(child: Text('Continue Booking',style: TextStyle(color: Colors.white),)),
                //      width: double.infinity,
                height: 55,
                color: korange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

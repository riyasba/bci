import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/screens/bussiness/views/business/notification_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EnterAmountForWithdrawalScreen extends StatefulWidget {
  const EnterAmountForWithdrawalScreen({super.key});

  @override
  State<EnterAmountForWithdrawalScreen> createState() =>
      _EnterAmountForWithdrawalScreenState();
}

class _EnterAmountForWithdrawalScreenState
    extends State<EnterAmountForWithdrawalScreen> {
  var amountController = TextEditingController();

  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: IconButton(
                            onPressed: () {
                             
                            Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: kwhite,
                            )),
                      ),
                    const Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Text(
                        'Payout',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 50,
                    )
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20),
                    //   child: InkWell(
                    //       onTap: () {
                    //         Get.to(() => const NotificationScreen());
                    //       },
                    //       child:
                    //           Image.asset('assets/images/notificationimage.png')),
                    // )
                  ],
                ),
              ),
            ),
          )),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SvgPicture.asset("assets/images/payment_vec_image.svg",height: size.height*0.4,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: TextField(
              controller: amountController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              decoration: InputDecoration(
                  hintText: 'Enter your amount',
                  hintStyle: TextStyle(fontSize: 18, color: kblue),
                  prefix: Text(
                    "₹ ",
                    style: primaryFont.copyWith(),
                  ),
                  border: const OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Obx(
        () => Padding(
          padding: const EdgeInsets.all(20.0),
          child: profileController.isLoading.isTrue
              ? Container(
                  height: 55,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40), color: kOrange),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : InkWell(
                  onTap: () {
                    if (amountController.text.isNotEmpty) {
                      profileController.withdrawAmountFromWallet(
                          amount: amountController.text);
                    }
                  },
                  child: Container(
                    height: 55,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: kOrange),
                    alignment: Alignment.center,
                    child: Text(
                      "Withdraw",
                      style: primaryFont.copyWith(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
        ),
      ),
        ],
      ),
    );
  }
}

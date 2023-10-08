import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class GooglePayPaymentScreen extends StatefulWidget {
  const GooglePayPaymentScreen({super.key});

  @override
  State<GooglePayPaymentScreen> createState() => _GooglePayPaymentScreenState();
}

class _GooglePayPaymentScreenState extends State<GooglePayPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: korange,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "UPI Transfer",
                  style: primaryFont.copyWith(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/images/qr_code.jpeg"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        String upiurl =
                            'upi://pay?pa=user@hdfgbank&pn=SenderName&tn=TestingGpay&am=100&cu=INR';
                        await launchUrl(Uri.parse(upiurl));
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: korange),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Text(
                            "Open in UPI APP",
                            style: primaryFont.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "UPI Address :",
                        style: primaryFont.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text("8939806807-1@okbizaxis"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.copy,
                        size: 16,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "UPI Number :",
                        style: primaryFont.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: const Text("8939806807"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          await Clipboard.setData(
                              const ClipboardData(text: "8939806807"));
                          Get.rawSnackbar(message: "Copied");
                        },
                        child: const Icon(
                          Icons.copy,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1.5,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Amount: ₹1500.00",
                  style: primaryFont.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("UPI Transaction ID or UTR from the receipt"),
                const SizedBox(
                  height: 15,
                ),
                const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter UTR Number',
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      "Required",
                      style: primaryFont.copyWith(
                          fontSize: 11, color: Colors.black45),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: korange),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                          "PAID",
                          style: primaryFont.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

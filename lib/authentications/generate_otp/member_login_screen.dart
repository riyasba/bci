import 'package:bci/authentications/generate_otp/privacy_policy_web_view_screen.dart';
import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/screens/members/sign_up_view/member_sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:phone_number_hint/phone_number_hint.dart';

class MemberLoginScreen extends StatefulWidget {
  const MemberLoginScreen({super.key});

  @override
  State<MemberLoginScreen> createState() => _MemberLoginScreenState();
}

class _MemberLoginScreenState extends State<MemberLoginScreen> {
  var phoneNumberController = TextEditingController();

  final authController = Get.find<AuthController>();

  String _result = 'Unknown';
  final _phoneNumberHintPlugin = PhoneNumberHint();

  Future<void> getPhoneNumber() async {
    String? result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      result = await _phoneNumberHintPlugin.requestHint() ?? '';

      phoneNumberController.text = getNumber(result);
    } on PlatformException {
      result = 'Failed to get hint.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _result = result ?? '';
    });
  }

  getNumber(String phone) {
    String testAp = "";
    String testAp2 = "";

    int length = phone.length - 10;

    for (int i = phone.length - 1; i > length - 1; i--) {
      testAp = testAp + phone[i];
    }

    for (int i = testAp.length - 1; i >= 0; i--) {
      testAp2 = testAp2 + testAp[i];
    }
    return testAp2;
  }

  @override
  void initState() {
    super.initState();
    getPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/images/a.png',
                  height: 250,
                ),
              ),
              Text(
                'Enter Your Phone Number',
                style: TextStyle(
                    fontSize: 22, color: kblue, fontWeight: FontWeight.w700),
              ),
              ksizedbox20,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'We will send you an ',
                  style: TextStyle(fontSize: 17, color: kblue),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'One Time Password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: kblue)),
                    TextSpan(
                      text: '\non this mobile number',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kblue),
                    ),
                  ],
                ),
              ),
              ksizedbox40,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  child: TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/images/Image 8.png'),
                      // suffixIcon: Image.asset('assets/images/Path 471.png'),
                      hintText: 'Enter your Mobile number',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              ksizedbox10,
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: authController.isLoading.isTrue
                      ? Container(
                          width: size.width,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              4,
                            ),
                            border: Border.all(color: const Color(0xffFFBF7E)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFFFF5C29),
                                blurRadius: 3.0,
                              )
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFFF5C29),
                                Color(0xFFFFCD38),
                              ],
                            ),
                          ),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            if (phoneNumberController.text.isNotEmpty) {
                              authController.getOtpFunction(
                                  mobileNumber: phoneNumberController.text);
                            } else {
                              Get.rawSnackbar(
                                backgroundColor: Colors.red,
                                messageText: Text(
                                  "Please Enter your number",
                                  style:
                                      primaryFont.copyWith(color: Colors.white),
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: size.width,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                4,
                              ),
                              border:
                                  Border.all(color: const Color(0xffFFBF7E)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFFFF5C29),
                                  blurRadius: 3.0,
                                )
                              ],
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFFFF5C29),
                                  Color(0xFFFFCD38),
                                ],
                              ),
                            ),
                            child: const Text(
                              'Generate OTP',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                ),
              ),
              ksizedbox10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: kblue),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(MemberSignUpScreen());
                    },
                    child: Text(
                      'Sign up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          color: kOrange),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "By continuing, you agree to BCI ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: kblue),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(PrivacyPolicyWebView());
                    },
                    child: Text(
                      'Privacy Policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          color: kblue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

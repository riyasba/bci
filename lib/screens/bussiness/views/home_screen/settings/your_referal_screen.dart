import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:clipboard/clipboard.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class BusinessYourReferralScreen extends StatefulWidget {
  const BusinessYourReferralScreen({super.key});

  @override
  State<BusinessYourReferralScreen> createState() => _BusinessYourReferralScreenState();
}

class _BusinessYourReferralScreenState extends State<BusinessYourReferralScreen> {

  final settingsController = Get.find<SettingsController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settingsController.getWalletList();
    settingsController.generateRefCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F8FD),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150.h,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Padding(
                      padding:const EdgeInsets.only(right: 20),
                      child: Text(
                        'Invite',
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            color:const Color(0xffF9F8FD)),
                      ),
                    ),
                    Image.asset('assets/images/helps.png')
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics:const BouncingScrollPhysics(),
          children: [
           const Image(
              image: AssetImage(
                "assets/images/pngwing.com (30).png",
              ),
              height: 300,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Referral Code',
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600, color: kblue),
                ),
              ),
            ),ksizedbox10,
            Obx( () =>
               Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: kblue)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(settingsController.referralCode.value,style: TextStyle(
                           fontSize: 16, color: kblue, fontWeight: FontWeight.w500),),
                        InkWell(
                          onTap: (){
                            FlutterClipboard.copy(settingsController.referralCode.value).then(
                                                  (value) =>
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "Copy to clipboard",
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          gravity: ToastGravity
                                                              .CENTER,
                                                          timeInSecForIosWeb: 1,
                                                          backgroundColor:
                                                              kblue,
                                                          textColor:
                                                              Colors.white,
                                                          fontSize: 16.0),
                                                  //print("code copied")
                                                );
                          },
                          child: Image.asset('assets/images/Icon awesome-copy.png')),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // authController.referralcode();
            //     String referralmsg = "Use my referral code $refferal when you sign up, and we'll both receive fantastic rewards. Don't forget to click on the link below to download the app and start enjoying the perks right away!\n\nhttps://drive.google.com/file/d/15HzAlb_iTWgtX_VN34_TXTQ4BS7KWnOR/view?usp=sharing";
            //     Share.share('$referralmsg');

            ksizedbox30,
            Row(
              children: [
                Text(
                  'Referral Count :  ',
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: kblue,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 30,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: korange),
      child: Center(
          child:settingsController.getWalletData.isEmpty ? const Text("") : 
          Text(settingsController.getWalletData.first.referrals.totalReferrals.toString(),
        style: TextStyle(
            color: kwhite,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      )),
      
    ),
              ],
            ),
            ksizedbox40,
            ksizedbox20,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: InkWell(
                onTap: () {
                  String referralmsg = "Use my referral code ${settingsController.referralCode.value} when you sign up, and we'll both receive fantastic rewards. Don't forget to click on the link below to download the app and start enjoying the perks right away!\n\n";
                  Share.share('$referralmsg');
                },
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
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
                  child: Center(
                    child: Text(
                      "Invite",
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            ksizedbox40
          ],
        ),
      ),
    );
  }
}

class  ReferalContainors extends StatelessWidget {
  const ReferalContainors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text("",
        style: TextStyle(
            color: kwhite,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      )),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: korange),
    );
  }
}
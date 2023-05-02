import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:introduction_screen/introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/01 Login Screen Options.png"),
          fit: BoxFit.fill
          ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            IntroductionScreen(
                  pages: [
              PageViewModel(
                title: 'Confidentiality of Information and\nPrivacy Protection',
                body:
                    """You can be sure that you are in safe hands. We respect\nprivacy of information and maximize usage of all vital\ninformation only for the benefit of the user. """,
                image: buildImage("assets/images/Group 5818.png"),
                //getPageDecoration, a method to customise the page style
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Credibility of Information',
                body:
                    """Information of both professionals and clients is credible,\nauthentic, and precise. Good features of an excellent\nplatform!""",
                image: buildImage("assets/icons/Asset 1 9.png"),
                //getPageDecoration, a method to customise the page style
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Real Workflow!',
                body:
                    """Regular posting of real-time projects ensures variety of\nscope and choice for both the clients and the professionals. """,
                image: buildImage("assets/icons/Asset 1 10.png"),
                //getPageDecoration, a method to customise the page style
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Talent Unmatched!',
                body:
                    """A huge database of skilled professionals, working arduously\nto fulfill client needs. """,
                image: Container(
                  width: 260,
                  height: 280,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(150)),
                  child: const Center(
                    child:
                        Image(image: AssetImage("assets/icons/Group 957.png")),
                  ),
                ),
                //getPageDecoration, a method to customise the page style
                decoration: getPageDecoration(),
              ),
                  ],
                  onDone: () {
              if (kDebugMode) {
                print("Done clicked");
              }
                  },
                  //ClampingScrollPhysics prevent the scroll offset from exceeding the bounds of the content.
                  scrollPhysics: const ClampingScrollPhysics(),
                  showDoneButton: true,
                  showNextButton: true,
                  showSkipButton: true,
                  isBottomSafeArea: true,
                  skip: Row(
              children: const [
                Text("Skip",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white)),
                Icon(
                  Icons.keyboard_double_arrow_right_outlined,
                  color: Colors.blue,
                ),
              ],
                  ),
                  next: Row(
              children: const [
                Icon(
                  Icons.keyboard_double_arrow_right_outlined,
                  color: Colors.red,
                ),
              ],
                  ),
                  done: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: InkWell(
                onTap: () {
                //  Get.offAll(HomeBottomNavigationBar());
                },
                child: Row(
                  children: const [
                    Text("Next",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white)),
                    Icon(
                      Icons.keyboard_double_arrow_right_outlined,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
                  ),
                  dotsDecorator: getDotsDecorator()),
          ],
        ),
      ),
    );
  }

//widget to add the image on screen
  Widget buildImage(String imagePath) {
    return Center(
        child: Image.asset(
      imagePath,
      width: 450,
      height: 300,
    ));
  }

  //method to customise the page style
  PageDecoration getPageDecoration() {
    return  PageDecoration(
      boxDecoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/01 Login Screen Options.png"),
          fit: BoxFit.fill
          ),
      ),
      imagePadding: EdgeInsets.only(top: 100),
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 30),
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(color: Colors.white, fontSize: 12),
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Color(0xff4600CA),
      color: Colors.white,
      activeSize: Size(11, 11),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}




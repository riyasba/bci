import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Others_continers extends StatelessWidget {
  const Others_continers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              containor_coupons(), containor_coupons(),
            ],
          ),
         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              containor_coupons(), containor_coupons(),
            ],
          ),  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              containor_coupons(), containor_coupons(),
            ],
          ),  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: [
              containor_coupons(), containor_coupons(),
            ],
          ),  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              containor_coupons(), containor_coupons(),
            ],
          ), ],
      ),
    );
  }
}

class containor_coupons extends StatelessWidget {
  const containor_coupons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,width: 190,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/h.png'),
            Text(
              'Lorem Ipsum',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500, color: kblue),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Container(child: Center(child: Text('ABCDHJJGF',style: TextStyle(fontSize: 16,color: kwhite),)),
              height: 40,
              width: 140,
              decoration: BoxDecoration(color: korange,borderRadius: BorderRadius.circular(4)),
            )
          ],
        ),
      ),
    );
  }
}

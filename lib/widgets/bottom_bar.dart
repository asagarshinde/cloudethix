import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloudethix/Responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  List<Widget> getInTouch(){
    return [
      const AutoSizeText(
        "Get in touch",
        style: TextStyle(fontSize: 30, color: Colors.white60),
      ),
      const AutoSizeText(
        "We ignite the fuel! To revamp your business and take "
            "it to the next level! ",
        maxLines: 5,
        style: TextStyle(fontSize: 20, color: Colors.white60),
      ),
      const SizedBox(
        height: 10,
      ),
      const AutoSizeText(
        "Address",
        style: TextStyle(
          fontSize: 25,
          color: Colors.white70,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const AutoSizeText(
        "1st Flr, Off No-2, \n Shankar Chatra Apt 575, \n Opp to Kesari Wada, \n Pune, 411030",
        style: TextStyle(
          fontSize: 15,
        ),
      )
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(31, 49, 79, 1)),
      width: MediaQuery.of(context).size.width,
      child: Responsive.isDesktop(context) ? Padding(
        padding: EdgeInsets.symmetric(horizontal : MediaQuery.of(context).size.width * 0.2, vertical: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getInTouch()
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Icon(
                    Icons.phone,
                    color: Colors.white70,
                    size: 100,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "+91 90000 00000",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.white70,
                    size: 100,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "admin@cloudethix.com",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            ...getInTouch(),
            SizedBox(
              height: Responsive.isMobile(context) ? 20 : 40,
            ),
            Icon(
              Icons.phone,
              color: Colors.white70,
              size: Responsive.isMobile(context) ? 50 : 100,
            ),
            SizedBox(
              height: Responsive.isMobile(context) ? 20 : 40,
            ),
            const Text(
              "+91 90000 00000",
              style: TextStyle(fontSize: 20),
            ),
            Icon(
              Icons.email,
              color: Colors.white70,
              size: Responsive.isMobile(context) ? 50 : 100,
            ),
            SizedBox(
              height: Responsive.isMobile(context) ? 20 : 40,
            ),
            const Text(
              "admin@cloudethix.com",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      )
    );
  }
}

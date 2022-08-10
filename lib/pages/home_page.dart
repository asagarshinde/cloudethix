import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloudethix/Responsive.dart';
import 'package:cloudethix/widgets/app_bar.dart';
import 'package:cloudethix/widgets/bottom_bar.dart';
import 'package:cloudethix/widgets/home_page_cards.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        // key: controller.scaffoldKey,
        preferredSize: Size(MediaQuery.of(context).size.width, 100),
        child: Header(),
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Responsive.isDesktop(context)
                  ? const MyHomePageDesktop()
                  : Responsive.isTablet(context)
                      ? const MyHomePageTablet()
                      : const MyHomePageMobile(),
            ]),
          )
        ],
      ),
    );
  }
}

class MyHomePageDesktop extends StatelessWidget {
  const MyHomePageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print(width);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width * 0.08, vertical: 50),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AutoSizeText(
                        "Help Challenge \nCritical Activities \n",
                        style: TextStyle(
                          fontSize: 80,
                          color: Color.fromRGBO(31, 49, 79, 1),
                        ),
                      ),
                      AutoSizeText(
                        "we are experience professionals who understand that IT services is changing, and are true partners who care about your success",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(31, 49, 79, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/Cloud_database_PNG.png',
                      fit: BoxFit.fitWidth),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: HomePageCards(),
          ),
          const Bottom()
        ],
      ),
    );
  }
}

class MyHomePageTablet extends StatelessWidget {
  const MyHomePageTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width * 0.08, vertical: 50),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AutoSizeText(
                        "Help Challenge \nCritical Activities \n",
                        style: TextStyle(
                          fontSize: 80,
                          color: Color.fromRGBO(31, 49, 79, 1),
                        ),
                      ),
                      AutoSizeText(
                        "we are experience professionals who understand that IT services is changing, and are true partners who care about your success",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(31, 49, 79, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/Cloud_database_PNG.png',
                      fit: BoxFit.fitWidth),
                ),
              ],
            ),
          ),
          HomePageCards(),
          const SizedBox(
            height: 50,
          ),
          const Bottom()
        ],
      ),
    );
  }
}

class MyHomePageMobile extends StatelessWidget  {
  const MyHomePageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AutoSizeText(
              "Help Challenge Critical Activities",
              style: TextStyle(
                fontSize: 40,
                color: Color.fromRGBO(31, 49, 79, 1),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AutoSizeText(
              "we are experience professionals who understand that IT services is changing, and are true partners who care about your success",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(31, 49, 79, 1),
              ),
            ),
          ),
          Image.asset('assets/Cloud_database_PNG.png', fit: BoxFit.fitWidth),
          SizedBox(height: 50,),
          Center(child: HomePageCards()),
          const SizedBox(
            height: 50,
          ),
          const Bottom()
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloudethix/Responsive.dart';
import 'package:cloudethix/controller/home_page_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePageCards extends StatelessWidget {
  final CardListController _cardController = Get.put(CardListController());

  HomePageCards({Key? key}) : super(key: key);

  getCard(context){
    if(Responsive.isDesktop(context)){
      return Wrap(
        // mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              _cardController.cardListItems.length,
                  (index) => HomePageCardItem(
                  description: _cardController.cardListItems[index]['description']
                      .toString(),
                  icon: _cardController.cardListItems[index]['icon'].toString(),
                  title: _cardController.cardListItems[index]['title'].toString(),
                  isActive: index == _cardController.hoveredIndex,
                  press: () => _cardController.setCardIndex(index))));
    }
    else if (Responsive.isTablet(context)) {
      return Wrap(
        children: List.generate(
              _cardController.cardListItems.length,
                  (index) => HomePageCardItem(
                  description: _cardController.cardListItems[index]['description']
                      .toString(),
                  icon: _cardController.cardListItems[index]['icon'].toString(),
                  title: _cardController.cardListItems[index]['title'].toString(),
                  isActive: index == _cardController.hoveredIndex,
                  press: () => _cardController.setCardIndex(index)))
      );
    }
    else{
      return Wrap(
          children: List.generate(
              _cardController.cardListItems.length,
                  (index) => HomePageCardItem(
                  description: _cardController.cardListItems[index]['description']
                      .toString(),
                  icon: _cardController.cardListItems[index]['icon'].toString(),
                  title: _cardController.cardListItems[index]['title'].toString(),
                  isActive: index == _cardController.hoveredIndex,
                  press: () => _cardController.setCardIndex(index))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  getCard(context));
  }
}

class HomePageCardItem extends StatefulWidget {
  const HomePageCardItem(
      {Key? key,
        required this.description,
        required this.icon,
        required this.title,
        required this.press,
        required this.isActive}) : super(key: key);

  final String description;
  final String icon;
  final String title;
  final VoidCallback press;
  final bool isActive;

  @override
  HomePageCardItemState createState() => HomePageCardItemState();
}

class HomePageCardItemState extends State<HomePageCardItem> {
  bool _isHover = false;
  Color cardColor = const Color.fromRGBO(234, 234, 244, 1);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          _isHover = value;
          if (value) {
            cardColor = Colors.white.withOpacity(0.5);
          } else {
            cardColor = const Color.fromRGBO(234, 234, 244, 1);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 5,
          color: cardColor,
          child: Container(
            padding: const EdgeInsets.all(50.0),
            width: 220,
            height: 340,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  widget.title,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      color: Color.fromRGBO(31, 49, 79, 1)),
                ),
                Icon(
                  IconData(int.parse(widget.icon), fontFamily: 'MaterialIcons'),
                  size: 80,
                  color: const Color.fromRGBO(144, 82, 254, 1),
                ),
                SizedBox(
                  width: 150,
                  child: AutoSizeText(
                    widget.description,
                    style: const TextStyle(
                        fontSize: 15, color: Color.fromRGBO(31, 49, 79, 1)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
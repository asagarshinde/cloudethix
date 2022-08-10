import 'package:cloudethix/constants.dart';
import 'package:cloudethix/controller/MenuController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../Responsive.dart';


class Header extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromRGBO(31, 49, 79, 1),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: kMaxWidth),
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (!Responsive.isDesktop(context))
                        IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _controller.openOrCloseDrawer();
                          },
                        ),
                      Image.asset('assets/CloudEthix_logo.jpeg',
                          width: 200 ,
                          fit: BoxFit.contain),
                      const Spacer(),
                      if (Responsive.isDesktop(context)) WebMenu(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WebMenu extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  WebMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        children: List.generate(
          _controller.menuItems.length,
              (index) => WebMenuItem(
            text: _controller.menuItems[index],
            isActive: index == _controller.selectedIndex,
            press: () => _controller.setMenuIndex(index),
          ),
        ),
      ),
    );
  }
}

class WebMenuItem extends StatefulWidget {
  const WebMenuItem(
      {Key? key,
        required this.isActive,
        required this.text,
        required this.press}) : super(key: key);

  final bool isActive;
  final String text;
  final VoidCallback press;

  @override
  State<WebMenuItem> createState() => _WebMenuItemState();
}

class _WebMenuItemState extends State<WebMenuItem> {
  bool _isHover = false;

  Color _borderColor() {
    if (widget.isActive) {
      return kPrimaryColor;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        String routeName = widget.text.replaceAll(' ','');
        context.go('/$routeName');
        widget.press();

      },
      onHover: (value) {
        setState(
              () {
            _isHover = true;
          },
        );
      },
      child: AnimatedContainer(
        duration: kDefaultDuration,
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
            border:
            Border(bottom: BorderSide(color: _borderColor(), width: 3))),
        child: Text(
          widget.text,
          style: TextStyle(
              color: Colors.white,
              fontWeight:
              widget.isActive ? FontWeight.w600 : FontWeight.normal),
        ),
      ),
    );
  }
}
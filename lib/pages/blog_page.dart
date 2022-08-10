import 'package:cloudethix/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 100),
          child: Header()
      ),
      body: const Text("This is Blog"),
    );
  }
}

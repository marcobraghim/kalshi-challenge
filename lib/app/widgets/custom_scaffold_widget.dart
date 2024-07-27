import 'package:flutter/material.dart';

class CustomScaffoldWidget extends StatelessWidget {
  final Widget child;

  const CustomScaffoldWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/appbar-title.png'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: child,
    );
  }
}

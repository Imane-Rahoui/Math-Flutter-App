import 'package:flutter/cupertino.dart';

class testless extends StatelessWidget {
  const testless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//------------------------------------------------------------------------------------------------

class testful extends StatefulWidget {
  const testful({Key? key}) : super(key: key);

  @override
  State<testful> createState() => _testfulState();
}

class _testfulState extends State<testful> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

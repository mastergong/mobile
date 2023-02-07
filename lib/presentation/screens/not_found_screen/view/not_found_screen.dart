import 'package:flutter/material.dart';
import '../../../common_widgets/template_screen.dart';

class NotFoundScreen extends StatefulWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  State<NotFoundScreen> createState() => _NotFoundScreenState();
}

class _NotFoundScreenState extends State<NotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return const TemplateScreen(
      //appBar: true,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
            child: Text(
          'ไม่พบหน้าที่ค้นหา',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )),
      ),
    );
  }
}

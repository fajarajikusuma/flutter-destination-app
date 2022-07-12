import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class detailNotification extends StatefulWidget {
  const detailNotification({Key key}) : super(key: key);

  @override
  State<detailNotification> createState() => _detailNotificationState();
}

class _detailNotificationState extends State<detailNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

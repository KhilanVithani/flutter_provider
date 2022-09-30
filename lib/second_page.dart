import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'data_class.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataClass>(builder: (context, dataclass, child) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<DataClass>(context, listen: false).decrementX();
                  },
                  child: Icon(Icons.remove),
                ),
                Spacer(),
                Text(
                  "${dataclass.x}",
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Back"),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      );
    });
  }
}

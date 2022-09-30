import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/data_class.dart';
import 'package:provider_state_management/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    Provider.of<DataClass>(context, listen: false).incrementX();
                  },
                  child: Icon(Icons.add),
                ),
                Spacer(),
                Text(
                  "${dataclass.x}",
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Get.to(SecondPage());
                  },
                  child: Text("Next Page"),
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

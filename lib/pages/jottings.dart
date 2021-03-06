import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_example/constants.dart';
import 'package:getx_example/controllers/jottings.dart';

class JottingsPage extends StatelessWidget {

  final JottingsController controller;

  JottingsPage(this.controller);

  @override
  Widget build(context) {

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("HashCode: " + controller.hashCode.toString())),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => controller.goNext(controller.items[index]),
              child: Container(
                height: 50,
                margin: const EdgeInsets.all(5),
                color: controller.getItemColor(controller.items[index].runtimeType),
                child: Center(
                  child: Text(controller.items[index].name),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: ButtonBar(
        buttonMinWidth: Get.width / 3.5,
        alignment: MainAxisAlignment.center,
        children: <RaisedButton>[
          RaisedButton(onPressed: () => controller.dialog.open(ItemType.note), child: Text("Add note")),
          RaisedButton(onPressed: () => controller.dialog.open(ItemType.todo), child: Text("Add todo")),
          RaisedButton(onPressed: () => controller.dialog.open(ItemType.folder), child: Text("Add folder")),
        ],
      ),
    );
  }
}

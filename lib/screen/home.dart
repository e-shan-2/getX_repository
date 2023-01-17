import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/validator/validator.dart';
import 'package:getx/widget/widget.dart';

import '../getxController/controller.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  // Defining the controller here
  final Controller countController = Get.put(Controller());
  TextEditingController _nameController = TextEditingController();
  final _formykey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.notification_add),
          onPressed: () {
            
            Get.toNamed('getdata');
          },
        ),
        title: const Text('getx'),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('cart');
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: GetBuilder<Controller>(initState: ((state) {
        _nameController = TextEditingController();
      }), builder: (countController) {
        return Form(
          key: _formykey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            FormWidget.formfields(
                name: "Enter The item you want to buy",
                controller: _nameController,
                validator: NameValidator.isempty),
            ElevatedButton(
                onPressed: () {if(_formykey.currentState!.validate()){
                  countController.addingItems(_nameController.text);
                //  this will clear the form field after submission
                  _nameController.clear();
                 } },
                child: const Text("add item"))
          ]),
        );
      }),
    );
  }
}

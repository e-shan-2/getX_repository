import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/getxController/controller.dart';
import 'package:getx/validator/validator.dart';
import 'package:getx/widget/widget.dart';

// ignore: must_be_immutable
class PostData extends StatelessWidget {
  PostData({Key? key}) : super(key: key);

  late TextEditingController _idController;
  late TextEditingController _bodyController;
  late TextEditingController _titleController;
  final _formkey = GlobalKey<FormState>();
  // This is for handling the post request in our app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post data')),
      body: GetBuilder<Controller>(
        initState: ((state) {
          // Get builder has an intit state in it
          _idController = TextEditingController();

          _bodyController = TextEditingController();
          _titleController = TextEditingController();
        }),
        builder: (countController) {
          return Form(
            key: _formkey,
            child: Column(children: [
              FormWidget.formfields(
                  controller: _idController,
                  name: "id",
                  validator: NameValidator.isempty),
              FormWidget.formfields(
                  controller: _titleController,
                  name: "title",
                  validator: NameValidator.isempty),
              FormWidget.formfields(
                controller: _bodyController,
                name: "body",
                validator: NameValidator.isempty,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      countController.sendDatafunc(
                        int.parse(_idController.text),
                        _titleController.text,
                        _bodyController.text,
                      );
                      _idController.clear();
                      _titleController.clear();
                      _bodyController.clear();
                      Get.back();
                    }
                  },
                  child: const Text("Submit")),
            ]),
          );
        },
      ),
    );
  }
}

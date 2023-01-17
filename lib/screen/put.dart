import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/getxController/controller.dart';
import 'package:getx/validator/validator.dart';

import 'package:getx/widget/widget.dart';

class PutData extends StatelessWidget {
  PutData({Key? key}) : super(key: key);
// intializing the text Editing controller
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  final TextEditingController _bodyController = TextEditingController();
   final _formykey = GlobalKey<FormState>();
  final Controller countController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    // acquring the value of previous page 
    Map dataModel = Get.arguments;
    _titleController.text = dataModel["title"].toString();
    _idController.text = dataModel["id"].toString();
    _bodyController.text = dataModel["body"].toString();

    return Scaffold(
        appBar: AppBar(
          title: const Text("put data"),
          
        ),
        body: Form(
          key: _formykey,
          child: Column(
            children: [
              FormWidget.formfields(
                controller: _idController,
                name: "Enter data",
                validator: NameValidator.isempty,
              ),
              FormWidget.formfields(
                controller: _titleController,
                name: "Enter data",
                 validator: NameValidator.isempty,
              ),
              FormWidget.formfields(
                controller: _bodyController,
                name: "Enter data",
                 validator: NameValidator.isempty,
              ),
              ElevatedButton(
                  onPressed: () {
                    if(_formykey.currentState!.validate()){
                    countController.updateDatafunc(
                      int.parse(_idController.text),
                       
                        _titleController.text,
                        _bodyController.text);
        
                        _idController.clear();
                   
                    _titleController.clear();
                    _bodyController.clear();
                    // Routing using GetX
                    Get.back();
                   } },
                 
                  child: const Text("Submit")),
                  
            ],
          ),
        ));
  }
}

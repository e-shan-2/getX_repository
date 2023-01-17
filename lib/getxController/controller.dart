import 'package:get/get.dart';
import 'package:getx/model/dataModel.dart';

import 'package:getx/services/api_services.dart';

class Controller extends GetxController {

  @override
  void onInit(){
   
    getDatafunc();
     super.onInit();
  }
  // for adding the item to the cart page
  List item = [].obs;
  RxList datamodel = [].obs;
  void addingItems(String name) {
    item.add(name);

    Get.snackbar('data', 'Posted Sucessfully',
        snackPosition: SnackPosition.BOTTOM);
    update();
  }
// data model for fake api

  Future<void> getDatafunc() async {
    List<DataModel> data = await Apiservices().getdata();
datamodel.value=data;
    update();
  }

// Function for posting the data
  Future<void> sendDatafunc(
      int id,  String title, String body) async {
    int statuscode = await Apiservices().postdata(id,  title, body);
    Get.snackbar('$statuscode', 'Posted Sucessfully',
        snackPosition: SnackPosition.BOTTOM);
  }

// function for updating the data
  Future<void> updateDatafunc(
      int id,  String title, String body) async {
    int statuscode = await Apiservices().putdata(id,title, body);
    Get.snackbar('$statuscode', 'Posted Sucessfully',
        snackPosition: SnackPosition.BOTTOM);
  }

// for deleting the request
  Future<void> deleteData(int id) async {
    int statuscode = await Apiservices().deleteData(id);
    Get.snackbar('$statuscode', 'Deleted Sucessfully',
        snackPosition: SnackPosition.BOTTOM);
    update();
  }

// function for deleting in cart
  void deletingItem(int id) {
    item.remove(item[id]);
    Get.snackbar('data', 'removed Sucessfully',
        snackPosition: SnackPosition.BOTTOM);
    update();
  }
}

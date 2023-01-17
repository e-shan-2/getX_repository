import 'package:flutter/material.dart';
import 'package:getx/getxController/controller.dart';
import 'package:get/get.dart';
import 'package:getx/screen/put.dart';

class GetData extends StatelessWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Get data from server"),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Get.toNamed('postdata');
              },
            ),
          ],
        ),
        // Simple state management
        body: GetBuilder<Controller>(builder: (countController) {
          //  it divides the list
          return countController.datamodel.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: ((context, index) => const Divider(
                        color: Colors.black,
                      )),
                  itemCount: countController.datamodel.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text('${countController.datamodel[i].id}'),
                      ),
                      title: Text('${countController.datamodel[i].title}'),
                      subtitle: Text('${countController.datamodel[i].body}'),
                      onTap: () {
                        // Sending data to the Post data page along with the arguments in map form
                        Get.to(() => PutData(), arguments: {
                          "id": countController.datamodel[i].id,
                          "title": countController.datamodel[i].title,
                          "body": countController.datamodel[i].body,
                        });
                      },
                      onLongPress: () {
                        countController
                            .deleteData(countController.datamodel[i].id);
                      },
                    );
                  },
                );
        }));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/getxController/controller.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

// The entire cart  entered by user will be dispalyed on this page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart page"),
        ),
        // Simple state management flutter
        body: GetBuilder<Controller>(
          builder: (countController) {
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
              ),
              itemCount: countController.item.length,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://picsum.photos/seed/picsum/200/${i + 100}')),
                  title: Text('${countController.item[i]}'),
                  subtitle: Text("Cost price:$i Rs"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      countController.deletingItem(i);
                    },
                  ),
                );
              },
            );
          },
        ));
  }
}

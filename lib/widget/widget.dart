import 'package:flutter/material.dart';

class FormWidget {
  static formfields(
      {String? name,
      TextEditingController? controller,
      String? Function(String?)? validator}) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        minLines: 1,
        maxLines: 3,
        validator: validator,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: name,
          prefixIcon: const Icon(Icons.local_grocery_store_outlined),
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }
}

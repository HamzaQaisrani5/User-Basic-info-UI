import 'package:flutter/material.dart';
//username textfield class
class Textf extends StatelessWidget {
  const Textf({
    super.key,
    //Make required both vars 
    required this.nameController,
    required this.firstName, 

  });
  //Define vars for controller and hinttext attribute 
  final TextEditingController nameController;
  final String firstName;
  


  @override
  Widget build(BuildContext context) {
    return TextField(
      //Use upper define variable 
      controller: nameController,
      cursorHeight: 16,
      style: const TextStyle(
          fontSize: 13,),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: firstName,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          )
        ),
      ),
    );
  }
}

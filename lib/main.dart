import 'package:bot_navi/userinfoform/form.dart';
import 'package:flutter/material.dart';
//main function where app start running
void main()=>runApp(
  const MyApp()
  );
  //Myapp class Global class of project
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //I choose dark theme 
      theme: ThemeData.dark(useMaterial3: true),
      //Calling actual userform class on home attribute
      home:const UserForm(),
    );
    
    
  }
}
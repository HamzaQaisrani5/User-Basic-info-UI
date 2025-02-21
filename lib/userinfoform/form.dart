import 'package:flutter/material.dart';
import 'widgets/calender_textf.dart';
import 'widgets/textf.dart';

//Prefer to use enum because of finite scenarios
enum Gender { select, male, female }

//User form UI class
class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  //Initially selected gender variable internally
  Gender? initialGender = Gender.select;
  //Initially labeled age display initially in UI
  double currentAge = 10;
  //controller variable of DOB Textfield
  final calenderCont = TextEditingController();
  // controller variable of first name Textfield
  final firstNameCont = TextEditingController();
  // controller variable of last name Textfield
  final lastNameCont = TextEditingController();
  //Don't forget to dispose them all too
  @override
  void dispose() {
    super.dispose();
    calenderCont.dispose();
    firstNameCont.dispose();
    lastNameCont.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Define a veriable for padding 
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //false this, To avoid overflow error
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Form',
        ),
        centerTitle: true,
      ),
      body: Padding(
        //Utilizing upper defined size variable for padding
        padding: EdgeInsets.all(size.width * 0.035),
        //For vertically responsive when mobile is on portrait mode
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //I choose to user see Both below texfields in row 
              Row(
                children: [
                  SizedBox(
                      width: size.width * 0.441,
                      //This is extracted widget defined in textf.dart file
                      child: Textf(
                        nameController: firstNameCont,
                        firstName: 'First Name',
                      )),
                  SizedBox(
                    width: size.width * 0.045,
                  ),
                  SizedBox(
                      width: size.width * 0.441,
                      child: Textf(
                          nameController: lastNameCont,
                          firstName: 'Last Name')),
                ],
              ),
              SizedBox(
                width: size.height * 0.045,
              ),
              //Just because of 2 radio buttons I love to play with Listtile here
              ListTile(
                leading: Radio<Gender>(
                    value: Gender.male,
                    groupValue: initialGender,
                    onChanged: (Gender? value) {
                      //Prefer to use setState rather then heavy provider plugin
                      setState(() {
                        initialGender = value;
                      });
                    }),
                title: const Text('Male'),
              ),
              ListTile(
                leading: Radio<Gender>(
                    value: Gender.female,
                    groupValue: initialGender,
                    onChanged: (Gender? value) {
                      setState(() {
                        initialGender = value;
                      });
                    }),
                title: const Text('Female'),
              ),
              SizedBox(
                width: size.height * 0.045,
              ),
              //User's age section start here
              const Text(
                'Age*',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              //Given me to create a slide for users age
              Slider(
                //Utilize upper initial age variable here
                value: currentAge,
                onChanged: (double value) {
                  setState(() {
                    currentAge = value;
                  });
                },
                max: 100,
                divisions: 90,
                //converted double numbers toint() to prevent floating integars on label
                label: currentAge.toInt().toString(),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              SizedBox(
                width: size.width,
                //This widget is compressed here, want to see, just jump on calender_textf.dart file
                child: CalenderTextf(calenderCont: calenderCont),
              ),
              SizedBox(
                height: size.height * 0.007,
              ),
              Row(
                //Used .center, I want to see submit button on center of screen
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //I would argue to use MaterialButton easy to decorate it.
                  MaterialButton(
                    onPressed: () {
                      //Reset all textfields buttons to empty when pressed
                      setState(() {
                        calenderCont.clear();
                        firstNameCont.clear();
                        lastNameCont.clear();
                        currentAge = 10;
                        initialGender = Gender.select;
                      });
                    },
                    color: Colors.white,
                    splashColor: Colors.grey,
                    shape: const ContinuousRectangleBorder(),
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


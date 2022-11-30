import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:spotify/demo/demo1.dart';
import 'package:spotify/screen/splash.dart';

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  final _formKey = GlobalKey<FormBuilderState>();
  List gender = ["Male", "Female", "Others"];
  String? username;
  String? password;
  String? genderselected;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Login"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: "username",
                  decoration: InputDecoration(
                      hintText: "Enter Your UserName", labelText: "username"),
                  readOnly: false,
                  enabled: true,
                  onChanged: (value) {
                    setState(() {
                      username = value;
                      print(username);
                    });
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(       
                        errorText: "this field is required"),
                  ]),
                ),
                FormBuilderTextField(
                  name: "password",
                  decoration: InputDecoration(
                      hintText: "Enter Your Password", labelText: "password"),
                  readOnly: false,
                  enabled: true,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                      print(password);
                    });
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "this field is required"),
                  ]),
                ),
                FormBuilderDropdown(name: "gender", items: gender.map((e) => DropdownMenuItem(value: e,child: Text(e))).toList(),
                    validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "this field is required"),]
                
                ),
                // FormBuilderTextField(
                //   name: "gender",
                  decoration: InputDecoration(
                      hintText: "selectgender", labelText: "gender"),
                  // readOnly: false,
                  // enabled: true,
                  onChanged: (newValue) {
                    setState(() {
                      genderselected = newValue.toString();
                     
                    });
                  },
                  // validator: FormBuilderValidators.compose([
                  //   FormBuilderValidators.required(
                  //       errorText: "this field is required"),
                //   ]),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (() {
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    username = _formKey.currentState!.value["username"].toString();
                      password = _formKey.currentState!.value["password"].toString();
                        genderselected = _formKey.currentState!.value["gender"].toString();
                        Navigator.push(context,MaterialPageRoute(builder: (context) => demo(
                           username:username!,
                           password:password!,
                           gender:genderselected!,
                           
 
                        ))
                        
                        );
                  }
                  
                }),
                 child:Text("Login"), ),
              ],
            ),
          ),
          
        ),
      ),
    );
  }
  
 
}

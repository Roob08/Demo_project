import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String? slider;
  String? Email;
  String? Multiline;
  String? PhoneNumber;
  String? Radio;
  String? Checkbox;
  String? CheckBoxGroup;
  String? segmented;
  String? FilterChip;
  String? choiceChip;
  String? datetime;
  String? DateTimePicker;
  String? UserPrefs;

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
                FormBuilderDropdown(
                  name: "gender",
                  items: gender
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "this field is required"),
                  ]),
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
                FormBuilderSlider(
                  name: "slider",
                  initialValue: 40,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  activeColor: Colors.red,
                  inactiveColor: Colors.black,
                ),
                FormBuilderTextField(
                  name: "Email",
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Enter Your Email", labelText: "Email Address"),
                  readOnly: false,
                  enabled: true,
                  onChanged: (value) {
                    setState(() {
                      Email = value;
                      print(Email);
                    });
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "this field is required"),
                    FormBuilderValidators.email()
                  ]),
                ),
                FormBuilderTextField(
                  name: "Multiline",
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  minLines: 2,
                  decoration: InputDecoration(
                      hintText: "Enter Your Text", labelText: "Text"),
                  readOnly: false,
                  enabled: true,
                  onChanged: (value) {
                    setState(() {
                      Multiline = value;
                      print(Multiline);
                    });
                  },
                ),
                FormBuilderTextField(
                  name: "Phone Number",
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                      hintText: "Enter Your Number", labelText: "Number"),
                  readOnly: false,
                  enabled: true,
                  onChanged: (value) {
                    setState(() {
                      PhoneNumber = value;
                      print(PhoneNumber);
                    });
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "this field is required"),
                    FormBuilderValidators.required()
                  ]),
                ),
                FormBuilderRadioGroup(
                  name: "Radio Button",
                  // controlAffinity: ControlAffinity.trailing,
                  options: ["c", "c++", "java"]
                      .map((e) => FormBuilderFieldOption(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      Radio = value;
                      print(Radio);
                    });
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "this field is required"),
                  ]),
                ),
                FormBuilderCheckbox(
                  name: "Box",
                  title: Row(
                    children: [
                      Text("Agree And Continue"),
                      Text(
                        " Terms And Continue",
                        style: TextStyle(color: Colors.teal),
                      )
                    ],
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "this field is required"),
                    FormBuilderValidators.required()
                  ]),
                ),
                FormBuilderCheckboxGroup(
                  name: "Check Box Group",
                  options: List.generate(5, (index) => index + 1)
                      .map((e) => FormBuilderFieldOption(
                            value: e,
                            child: Text(e.toString()),
                          ))
                      .toList(),
                ),
                // SizedBox(height: 10,),
                FormBuilderSegmentedControl(
                  name: "segmented",
                  options: List.generate(5, (index) => index + 1)
                      .map((e) => FormBuilderFieldOption(
                          value: e, child: Icon(Icons.favorite)))
                      .toList(),
                  decoration: InputDecoration(
                    labelText: "Segments",
                  ),
                ),
                FormBuilderFilterChip(
                  name: "Filter Chip",
                  options: ["dart", "c", "c++"]
                      .map((e) => FormBuilderChipOption(
                          value: e, child: Text(e.toString())))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      FilterChip = value.toString();
                      print(FilterChip);
                    });
                    decoration:
                    InputDecoration(labelText: "select any option");
                  },
                ),
                FormBuilderChoiceChip(
                  name: "choice chip",
                  selectedColor: Colors.green[200],
                  options: List.generate(5, (index) => index + 1)
                      .map((e) => FormBuilderChipOption(
                            value: e,
                            child: Text(e.toString()),
                          ))
                      .toList(),
                ),
                FormBuilderDateTimePicker(
                  name: "Date Time",
                  fieldLabelText: "datetime",
                  initialValue: DateTime.now(),
                  firstDate: DateTime(2020, 27, 09),
                  lastDate: DateTime.now(),
                ),
                FormBuilderDateRangePicker(
                  name: "DateTimePicker",
                  firstDate: DateTime(2022, 11, 04),
                  lastDate: DateTime(2022, 12, 31),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "this field is required"),
                  ]),
                  decoration: InputDecoration(
                      hintText: "select time picker",
                      labelText: "date time picker"),
                  onChanged: ((value) {
                    setState(() {
                      DateTimePicker = value.toString();
                      print(DateTimePicker);
                    });
                  }),
                ),

                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: (() {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      username =
                          _formKey.currentState!.value["username"].toString();
                      password =
                          _formKey.currentState!.value["password"].toString();
                      genderselected =
                          _formKey.currentState!.value["gender"].toString();
                      userInfo(username!, password!, genderselected!);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Demo(
                                    username: username!,
                                    password: password!,
                                    gender: genderselected!,
                                  )));
                    }
                  }),
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void userInfo(String username, String password, String genderselected) async {
  SharedPreferences userInfo = await SharedPreferences.getInstance();
  userInfo.setStringList(
      'UserInfo', [username, password, genderselected]);
  print(userInfo.getStringList('userInfo'));
}

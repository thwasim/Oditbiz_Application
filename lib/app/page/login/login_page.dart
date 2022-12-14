import 'dart:developer';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:oditbiz/app/page/home/homepage.dart';
import 'package:oditbiz/app/page/recipts/receipt_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? validers(value) {
    RegExp regex = RegExp(r'^.{6,}$');
    if (value!.isEmpty) {
      return ("Enter Valid Data");
    }
    if (!regex.hasMatch(value)) {
      return ("try again");
    }
    return null;
  }

  void togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  final formKey = GlobalKey<FormState>();

  bool isHidden = true;

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Image.asset(
                  "assets/images/Icon.png",
                  width: MediaQuery.of(context).size.width * 0.36,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                const Text(
                  "Login to your Account",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: "poppins",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF383838),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 17, left: 17, top: 17),
                        child: TextFormField(
                          validator: validation,
                          controller: usernamecontroller,
                          decoration: const InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(
                              fontFamily: "poppins",
                              fontSize: 14,
                              color: Color(0xFF838383),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 17, left: 17, top: 17),
                        child: TextFormField(
                          validator: validation,
                          obscureText: isHidden,
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(
                              fontFamily: "poppins",
                              fontSize: 14,
                              color: Color(0xFF838383),
                            ),
                            suffixIcon: InkWell(
                              onTap: togglePasswordView,
                              child: Icon(
                                isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 17, left: 17, top: 17),
                        child: DropDownTextField(
                          readOnly: true,
                          textFieldDecoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 25),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Branch Selection",
                            hintStyle: TextStyle(
                              fontFamily: "poppins",
                              fontSize: 14,
                              color: Color(0xFF838383),
                            ),
                          ),
                          listSpace: 20,
                          listPadding: ListPadding(top: 20),
                          enableSearch: true,
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownList: const [
                            DropDownValueModel(
                                name: 'wayanad', value: "value1"),
                            DropDownValueModel(name: 'caliut', value: 0),
                            DropDownValueModel(name: 'kanuur', value: 1),
                            DropDownValueModel(name: 'video', value: 2),
                            DropDownValueModel(name: 'back', value: 3),
                            DropDownValueModel(name: 'enter', value: 4),
                            DropDownValueModel(name: 'name', value: 5),
                            DropDownValueModel(name: 'pause', value: 6),
                          ],
                          listTextStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          dropDownItemCount: 8,
                          onChanged: (values) {},
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 13, left: 14, bottom: 20),
                        child: Material(
                          color: const Color(0xFF680E2A),
                          elevation: 7,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.circular(3),
                          child: MaterialButton(
                            height: MediaQuery.of(context).size.height * 0.068,
                            minWidth: MediaQuery.of(context).size.width * 1,
                            onPressed: () {
                              log("message");
                              if (formKey.currentState!.validate()) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (ctx) => const Homescreen(),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

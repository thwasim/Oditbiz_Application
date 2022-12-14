import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LedgerRegistration extends StatelessWidget {
  LedgerRegistration({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final formKee = GlobalKey<FormState>();

  heading(String heading) {
    return Padding(
      padding: const EdgeInsets.only(left: 29, top: 13),
      child: Text(
        heading,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          fontFamily: "poppins",
          color: Color(0xFF838383),
        ),
      ),
    );
  }

  String? ledgerValidation(value) {
    RegExp regex = RegExp(r'^.{1,}$');
    if (value == null) {
      return ("Enter The Field");
    }
    if (!regex.hasMatch(value)) {
      return ("Enter Valid data");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "Add Ledger",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "poppins",
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKee,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heading("Name"),
              Padding(
                padding: const EdgeInsets.only(right: 23, left: 23, top: 5),
                child: TextFormField(
                  validator: ledgerValidation,
                  controller: nameController,
                ),
              ),
              heading("Head"),
              Padding(
                padding: const EdgeInsets.only(right: 23, left: 23, top: 5),
                child: DropDownTextField(
                  dropdownRadius: 10,
                  readOnly: true,
                  textFieldDecoration: const InputDecoration(
                    hintText: "Select Head",
                    hintStyle: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 14,
                    ),
                  ),
                  listSpace: 20,
                  listPadding: ListPadding(top: 20),
                  enableSearch: true,
                  searchDecoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: "Search",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required field";
                    } else {
                      return null;
                    }
                  },
                  dropDownList: const [
                    DropDownValueModel(name: 'wayanad', value: "value1"),
                    DropDownValueModel(name: 'caliut', value: "value2"),
                    DropDownValueModel(name: 'kannur', value: "value3"),
                    DropDownValueModel(name: 'video', value: "value4"),
                    DropDownValueModel(name: 'back', value: "value5"),
                    DropDownValueModel(name: 'enter', value: "value6"),
                    DropDownValueModel(name: 'name', value: "value7"),
                    DropDownValueModel(name: 'pause', value: "value8"),
                  ],
                  listTextStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  dropDownItemCount: 8,
                  onChanged: (values) {},
                ),
              ),
              heading("Mobile"),
              Padding(
                padding: const EdgeInsets.only(right: 23, left: 23, top: 5),
                child: TextFormField(
                  validator: ledgerValidation,
                  controller: mobileController,
                ),
              ),
              heading("GST"),
              Padding(
                padding: const EdgeInsets.only(right: 23, left: 23, top: 5),
                child: TextFormField(
                  validator: ledgerValidation,
                  controller: gstController,
                ),
              ),
              heading("Address"),
              Padding(
                padding: const EdgeInsets.only(
                    right: 23, left: 23, top: 5, bottom: 40),
                child: TextFormField(
                  validator: ledgerValidation,
                  controller: addressController,
                  maxLines: 6,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: Material(
          color: const Color(0xFF680E2A),
          elevation: 7,
          shadowColor: Colors.black,
          borderRadius: BorderRadius.circular(8),
          child: MaterialButton(
            height: MediaQuery.of(context).size.height * 0.07,
            minWidth: MediaQuery.of(context).size.width * 1,
            onPressed: () {
              if (formKee.currentState!.validate()) {
                Navigator.pop(context);
              }
            },
            child: const Text(
              'Save',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "poppins",
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

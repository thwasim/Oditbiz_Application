import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class SaleOrderFields extends StatefulWidget {
  const SaleOrderFields({Key? key}) : super(key: key);

  @override
  State<SaleOrderFields> createState() => _SaleOrderFieldsState();
}

TextEditingController amountcontroller = TextEditingController();
TextEditingController consumercontoller = TextEditingController();

String? validations(value) {
  RegExp regex = RegExp(r'^.{0,}$');
  if (value!.isEmpty) {
    return ("Enter The Field");
  }
  if (!regex.hasMatch(value)) {
    return ("Enter Valid data");
  }
  return null;
}

headings(String heading) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, top: 16),
    child: Text(
      heading,
      style: const TextStyle(
        fontFamily: "poppins",
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: Color(0xFF838383),
      ),
    ),
  );
}

class _SaleOrderFieldsState extends State<SaleOrderFields> {
  final formKeys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14, left: 12, top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headings("Cash accounts"),
          Card(
            elevation: 1,
            child: DropDownTextField(
              readOnly: true,
              textFieldDecoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 25),
                fillColor: Colors.white,
                filled: true,
                hintText: "Select Account",
                hintStyle: TextStyle(
                  color: Color(0xFF838383),
                ),
              ),
              listSpace: 20,
              listPadding: ListPadding(top: 20),
              enableSearch: true,
              searchDecoration: const InputDecoration(
                hintText: "Search",
                contentPadding: EdgeInsets.only(right: 17, left: 17, top: 17),
              ),
              // controller: cashAcountcontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required field";
                } else {
                  return null;
                }
              },
              dropDownList: const [
                DropDownValueModel(name: 'Cash Account', value: "value1"),
                DropDownValueModel(name: 'Cash Account', value: "value2"),
                DropDownValueModel(name: 'Cash Account', value: "value3"),
                DropDownValueModel(name: 'Cash Account', value: "value4"),
                DropDownValueModel(name: 'Cash Account', value: "value5"),
                DropDownValueModel(name: 'Cash Account', value: "value6"),
                DropDownValueModel(name: 'Cash Account', value: "value7"),
                DropDownValueModel(name: 'Cash Account', value: "value8"),
              ],
              listTextStyle:
                  const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              dropDownItemCount: 8,
              onChanged: (values) {},
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              headings("Customer accounts"),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "O B: 500",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF680E2A),
                  ),
                ),
              )
            ],
          ),
          Card(
            elevation: 1,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: DropDownTextField(
              readOnly: true,
              textFieldDecoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 25),
                fillColor: Colors.white,
                filled: true,
                hintText: "Select Customer",
                hintStyle: TextStyle(
                  color: Color(0xFF838383),
                ),
              ),
              listSpace: 20,
              listPadding: ListPadding(top: 20),
              enableSearch: true,
              searchDecoration: const InputDecoration(
                hintText: "Search",
                contentPadding: EdgeInsets.only(right: 17, left: 17, top: 17),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required field";
                } else {
                  return null;
                }
              },
              dropDownList: const [
                DropDownValueModel(name: 'cash account', value: "value1"),
                DropDownValueModel(name: 'cash account', value: "value2"),
                DropDownValueModel(name: 'cash account', value: "value3"),
                DropDownValueModel(name: 'cash account', value: "value4"),
                DropDownValueModel(name: 'cash account', value: "value5"),
                DropDownValueModel(name: 'cash account', value: "value6"),
                DropDownValueModel(name: 'cash account', value: "value7"),
                DropDownValueModel(name: 'cash account', value: "value8"),
              ],
              listTextStyle:
                  const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              dropDownItemCount: 8,
              onChanged: (values) {},
            ),
          ),
          headings("Customer"),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: TextFormField(
              validator: validations,
              controller: consumercontoller,
            ),
          ),
          headings("Sale man"),
          Card(
            elevation: 1,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: DropDownTextField(
              readOnly: true,
              textFieldDecoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 25),
                fillColor: Colors.white,
                filled: true,
                hintText: "Select Sale man",
                hintStyle: TextStyle(
                  color: Color(0xFF838383),
                ),
              ),
              listSpace: 20,
              listPadding: ListPadding(top: 20),
              enableSearch: true,
              searchDecoration: const InputDecoration(
                hintText: "Search",
                contentPadding: EdgeInsets.only(right: 17, left: 17, top: 17),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required field";
                } else {
                  return null;
                }
              },
              dropDownList: const [
                DropDownValueModel(name: 'Personal name', value: 0),
                DropDownValueModel(name: 'Personal Name', value: 1),
                DropDownValueModel(name: 'Personal Name', value: 2),
                DropDownValueModel(name: 'Personal Name', value: 3),
                DropDownValueModel(name: 'Personal Name', value: 4),
                DropDownValueModel(name: 'Personal Name', value: 5),
                DropDownValueModel(name: 'Personal Name', value: 6),
                DropDownValueModel(name: 'Personal Name', value: 7),
              ],
              listTextStyle:
                  const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              dropDownItemCount: 8,
              onChanged: (values) {},
            ),
          ),
        ],
      ),
    );
  }
}

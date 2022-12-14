import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class ReceiptsField extends StatefulWidget {
  const ReceiptsField({Key? key}) : super(key: key);

  @override
  State<ReceiptsField> createState() => _ReceiptsFieldState();
}

TextEditingController noisecontroller = TextEditingController();
TextEditingController cashAcountcontroller = TextEditingController();
TextEditingController paircontroller = TextEditingController();
TextEditingController amountcontroller = TextEditingController();
TextEditingController discountcontoller = TextEditingController();
TextEditingController remarkcontroller = TextEditingController();
TextEditingController dateinputcontroller = TextEditingController();

String? validation(value) {
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
        fontWeight: FontWeight.w600,
        fontSize: 13,
        fontFamily: "poppins",
        color: Color(0xFF838383),
      ),
    ),
  );
}

class _ReceiptsFieldState extends State<ReceiptsField> {
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
              headings("Payer"),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "O B: 500",
                  style: TextStyle(
                    fontFamily: "poppins",
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
                hintText: "Select pair",
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
                DropDownValueModel(name: 'Personal Name', value: "value1"),
                DropDownValueModel(name: 'Personal Name', value: "value2"),
                DropDownValueModel(name: 'Personal Name', value: "value3"),
                DropDownValueModel(name: 'Personal Name', value: "value4"),
                DropDownValueModel(name: 'Personal Name', value: "value5"),
                DropDownValueModel(name: 'Personal Name', value: "value6"),
                DropDownValueModel(name: 'Personal Name', value: "value7"),
                DropDownValueModel(name: 'Personal Name', value: "value8"),
              ],
              listTextStyle:
                  const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              dropDownItemCount: 8,
              onChanged: (values) {},
            ),
          ),
          headings("Amount"),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: TextFormField(
              validator: validation,
              controller: amountcontroller,
            ),
          ),
          headings("Discount"),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: TextFormField(
              validator: validation,
              controller: discountcontoller,
            ),
          ),
          headings("Remark"),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: TextFormField(
              validator: validation,
              maxLines: 5,
              controller: remarkcontroller,
            ),
          ),
        ],
      ),
    );
  }
}

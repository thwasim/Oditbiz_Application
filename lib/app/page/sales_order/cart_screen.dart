import 'package:flutter/material.dart';
import 'package:oditbiz/app/page/sales_order/cart_screen_listview.dart';
import 'package:oditbiz/app/page/sales_order/sales_order_detalis.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          "sales order",
          style: TextStyle(
              fontFamily: "poppins",
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Invoice No: 20",
                  style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF383838),
                  ),
                ),
                Text(
                  "Date: 11-12-2022",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "poppins",
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF383838),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 214, 210, 210),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    bottomSheet(context);
                  },
                  child: SizedBox(
                    height: 30,
                    width: 25,
                    child: Image.asset("assets/images/filter.png"),
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Card(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFFB9B2B2),
                        ),
                        hintText: "Search by name",
                        hintStyle: TextStyle(
                          color: Color(0xFF838383),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.047,
                  width: MediaQuery.of(context).size.width * 0.136,
                  decoration: BoxDecoration(
                    color: const Color(0xFF680E2A),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const CartScreenListview(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 3,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 160,
                  height: 59,
                  decoration: BoxDecoration(
                    color: const Color(0xFFffffff),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: Color(0xFF680E2A),
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 3,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const SaleOrderDetalisScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 160,
                  height: 59,
                  decoration: BoxDecoration(
                    color: const Color(0xFF680E2A),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: Color.fromARGB(255, 208, 205, 205),
                          fontFamily: "poppins",
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.38,
          child: Column(
            children: [
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  color: Color(0xFF680E2A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    const Center(
                      child: Text(
                        'Search by',
                        style: TextStyle(
                          fontFamily: "poppins",
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.cancel_outlined,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const ToggleButton()
            ],
          ),
        );
      },
    );
  }
}

class ToggleButton extends StatefulWidget {
  const ToggleButton({Key? key}) : super(key: key);
  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  int value = 0;
  Widget customRadioButton(String text, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          setState(() {
            value = index;
          });
        },
        title: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "poppins",
              color: (value == index)
                  ? const Color.fromARGB(255, 0, 0, 0)
                  : const Color.fromARGB(255, 140, 135, 135),
            ),
          ),
        ),
        trailing: Container(
          width: 23,
          height: 23,
          decoration: BoxDecoration(
            color: (value == index)
                ? Colors.green
                : const Color.fromARGB(255, 203, 198, 198),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customRadioButton("By name", 1),
        customRadioButton("By code", 2),
        customRadioButton("by barcode", 3)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:oditbiz/app/page/sales_order/cart_screen.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Add products",
          style: TextStyle(
              fontFamily: "poppins",
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.16,
                decoration: BoxDecoration(
                  color: const Color(0xFF680E2A),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 28),
                      child: Text(
                        "iphone 6 Plus",
                        style: TextStyle(
                          fontFamily: "poppins",
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Selling Price",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "poppins"),
                            ),
                            Text(
                              "12455",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "poppins"),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Cost",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "poppins",
                              ),
                            ),
                            Text(
                              "12000",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: "poppins",
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "stock",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "poppins",
                              ),
                            ),
                            Text(
                              "12540",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: "poppins",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              addProductField("Bach Number", TextInputType.number, context),
              addProductField("Quantity", TextInputType.number, context),
              addProductField("Rate", TextInputType.number, context),
              addProductField("Discount Rate", TextInputType.number, context),
              addProductField("GST%", TextInputType.number, context),
              addProductField("Total", TextInputType.number, context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 14, left: 12, bottom: 20),
        child: Material(
          color: const Color(0xFF680E2A),
          elevation: 5,
          borderRadius: BorderRadius.circular(8),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.07,
            padding: const EdgeInsets.fromLTRB(10, 11, 10, 10),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) =>const CartScreen(),
                ),
              );
            },
            child: const Text(
              'Add to Cart ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  addProductField(String heading, TextInputType type, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            heading,
            style: const TextStyle(
              fontSize: 17,
              fontFamily: "poppins",
              fontWeight: FontWeight.w500,
              color: Color(0xFF838383),
            ),
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 20,
                    height: 2,
                    color: const Color.fromARGB(255, 235, 230, 230),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.54,
                    child: TextFormField(
                      keyboardType: type,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

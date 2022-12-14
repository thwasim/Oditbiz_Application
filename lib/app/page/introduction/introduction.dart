import 'package:flutter/material.dart';
import 'package:oditbiz/app/page/ledger/ledger_registration.dart';
import 'package:oditbiz/app/page/login/login_page.dart';
import 'package:oditbiz/app/page/payment/payment_screen.dart';
import 'package:oditbiz/app/page/recipts/receipt_page.dart';
import 'package:oditbiz/app/page/sales_order/add_product.dart';
import 'package:oditbiz/app/page/sales_order/sales_order.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buttons(
            context,
            "Ledger",
            () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => LedgerRegistration()));
            },
            const Color.fromARGB(255, 39, 78, 235),
          ),
          buttons(
            context,
            "Recipts",
            () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const ReceiptScreen()));
            },
            const Color.fromARGB(255, 39, 78, 235),
          ),
          buttons(context, "Login", () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const LoginPage()));
          }, const Color(0xFF680E2A)),
          buttons(
            context,
            "payment",
            () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => PaymentScreen()));
            },
            const Color.fromARGB(255, 39, 78, 235),
          ),
          buttons(
            context,
            "sales order",
            () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => AddSalesOrderScreen()));
            },
            const Color.fromARGB(255, 39, 78, 235),
          ),
          buttons(
            context,
            "add product",
            () => Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const AddProductScreen())),
            const Color.fromARGB(255, 39, 78, 235),
          )
        ],
      ),
    );
  }

  buttons(
    BuildContext context,
    String name,
    Function()? ontap,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 13, left: 14, bottom: 20),
      child: Material(
        color: color,
        elevation: 7,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(3),
        child: InkWell(
          onTap: ontap,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.068,
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontFamily: "poppins",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

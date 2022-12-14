import 'package:flutter/material.dart';
import 'package:oditbiz/app/page/ledger/ledger_registration.dart';
import 'package:oditbiz/app/page/recipts/receipt_page.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(100000, (i) => " $i");

  List items = <String>[];

  bool isShowData = true;

  void filterSearchResults(String data) {
    if (data.isEmpty) {
      setState(() {
        items = [];
      });
      return;
    }
    List<String> searchList = <String>[];
    searchList.addAll(duplicateItems);
    if (data.isNotEmpty) {
      List<String> listData = <String>[];
      for (var item in searchList) {
        if (item.contains(data)) {
          listData.add(item);
        }
      }
      setState(() {
        items.clear();
        items.addAll(listData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Ledger registration",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: "poppins",
            color: Color(0xFF383838),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF680E2A),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => LedgerRegistration(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text("Add "),
                  Icon(
                    Icons.add_circle_outlined,
                    size: 19,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 18, right: 18, bottom: 8, top: 23),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 38, 37, 37),
                    blurRadius: 0.1,
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: const InputDecoration(
                  hintText: "Search Branch",
                  hintStyle: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 14,
                    color: Color(0xFFB9B2B2),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFFB9B2B2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: items.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Search Anything !',
                          style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(left: 6, right: 6),
                          child: Card(
                            elevation: 2,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Center(
                                child: Text(
                                  "Business & Company Name Idea${items[index]}",
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

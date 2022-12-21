import 'package:flutter/material.dart';

class ReciptsSearchScreen extends StatefulWidget {
  const ReciptsSearchScreen({Key? key}) : super(key: key);
  @override
  State<ReciptsSearchScreen> createState() => _ReciptsSearchScreenState();
}

class _ReciptsSearchScreenState extends State<ReciptsSearchScreen> {
  TextEditingController searchController = TextEditingController();

  final duplicateItems = List<String>.generate(100, (i) => " $i");

  List items = <String>[];

  void filterSearchResults(String data) {
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
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        onChanged: (value) {
                          filterSearchResults(value);
                        },
                        controller: searchController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFFB9B2B2),
                          ),
                          hintText: "Search Payer",
                          hintStyle: TextStyle(
                            fontFamily: "s",
                            fontSize: 14,
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
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Card(
                elevation: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.117,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "#Inv No",
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            Text(
                              "12-12-2022",
                              style: TextStyle(
                                fontFamily: "poppins",
                                fontSize: 14,
                                color: Color(0xFF838383),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Hameed",
                              style: TextStyle(
                                fontFamily: "poppins",
                                fontSize: 16,
                                color: Color(0xFF838383),
                              ),
                            ),
                            Text(
                              "5000",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF680E2A),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
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
          height: MediaQuery.of(context).size.height * 0.36,
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
                    const SizedBox(width: 30),
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
                  ? Colors.black
                  : const Color.fromARGB(255, 140, 135, 135),
            ),
          ),
        ),
        trailing: Container(
          width: 25,
          height: 25,
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
        customRadioButton("Invoice Search", 1),
        customRadioButton("Payer Search", 2),
        customRadioButton("Amount Search", 3)
      ],
    );
  }
}

import 'package:flutter/material.dart';

class SaleOrderDetalisScreen extends StatelessWidget {
  const SaleOrderDetalisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> datas = [
      "Sub Total",
      "GST",
      "NET",
      "Other Discount",
      "other charges",
      "Round Off",
      "Grand Total"
    ];

    heading(String heading) {
      return Padding(
        padding: const EdgeInsets.only(top: 5, left: 1),
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: datas.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        shadowColor: const Color.fromARGB(255, 236, 234, 234),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 35),
                                      child: Text(
                                        datas[index],
                                        style: const TextStyle(
                                          fontFamily: "poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Color(0xFF838383),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Container(
                                      width: 2,
                                      height: 55,
                                      color: const Color.fromARGB(
                                          255, 225, 222, 222),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              Card(
                elevation: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heading("Cash Received"),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        heading("Balance"),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        heading("Remarks"),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextFormField(
                            maxLines: 5,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
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
                    color: const Color(
                      0xFFFFFFFF,
                    ),
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
                onTap: () {},
                child: Container(
                  width: 160,
                  height: 59,
                  decoration: BoxDecoration(
                    color: const Color(0xFF680E2A),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Color.fromARGB(255, 208, 205, 205),
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w600,
                      ),
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
}

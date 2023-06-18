import 'package:e_trade/screens/form.dart';
import 'package:e_trade/utils/api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic data;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    dynamic apiData = await Api().getAllProducts();
    setState(() {
      data = apiData;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            data == null
                ? const Text("Loading...")
                : data.data["data"].length == 0
                    ? const Text("Nothing Here")
                    : SizedBox(
                        height: size.height * 0.5,
                        width: size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.data["data"].length,
                          itemBuilder: (context, index) {
                            String photoURL = data != null
                                ? data.data["data"][index]["photo"]
                                    .replaceAll("uploads\\", '')
                                : "NOT FOUND";
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                  width: 250,
                                  decoration: BoxDecoration(
                                      color: Colors.green.shade500,
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Column(
                                    children: [
                                    data.data["data"][index]["photo"] == "no-pic.jpg" ?const Text("No Pic Found") :  Image.network(
                                        "http://localhost:8000/$photoURL",
                                        width: 240,
                                        height: 150,
                                      ),
                                      Text(
                                        data.data["data"][index]["title"],
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        data.data["data"][index]["description"],
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "${data.data["data"][index]["price"]} \$",
                                        style:
                                            const TextStyle(color: Colors.red),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: InkWell(
                                              onTap: () {
                                                 Navigator.push(context, MaterialPageRoute(builder: (context) => FormScreen( id: data.data["data"][index]["_id"], )));

                                               },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: const Text(
                                                  "Update",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: InkWell(
                                              onTap: () {
                                                Api().deleteProducts(
                                                    data.data["data"][index]
                                                        ["_id"]);
                                                setState(() {});
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: const Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            );
                          },
                        ),
                      ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const FormScreen()));

                 },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    "Add a new item",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

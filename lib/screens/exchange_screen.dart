import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../const.dart';
import '../kurs.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  List<Kurs> valyuta = [];

  List<String> val = [];

  String log = "images/uzb.jpg";

  TextEditingController controller0 = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  void getValyuta() async {
    final response = await http
        .get(Uri.parse('https://cbu.uz/uz/arkhiv-kursov-valyut/json/'));
      setState(() {
        (json.decode(response.body)).forEach((v){
          valyuta.add(Kurs.fromJson(v));
        });
      });
  }

  @override
  void initState() {
    super.initState();
    getValyuta();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(log),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Ayriboshlash",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () => {
                controller0.clear(),
                controller1.clear(),
                controller2.clear(),
                controller3.clear(),
                controller4.clear(),
              },
              child: const Text("Tozalash"),
            ),
          ),
        ],
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: valyuta.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).cardColor,
                      ),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("images/uzb.jpg"),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: size.width * .5,
                            child: TextField(
                              controller: controller0,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: const InputDecoration(
                                hintText: "UZS",
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  log = "images/uzb.jpg";
                                });
                                controller0.text != ''
                                    ? {
                                        controller1.text =
                                            (double.parse(value) /
                                                    double.parse(
                                                        valyuta[0].rate!))
                                                .toString(),
                                        controller2.text =
                                            (double.parse(value) /
                                                    double.parse(
                                                        valyuta[1].rate!))
                                                .toString(),
                                        controller3.text =
                                            (double.parse(value) /
                                                    double.parse(
                                                        valyuta[2].rate!))
                                                .toString(),
                                        controller4.text =
                                            (double.parse(value) /
                                                    double.parse(
                                                        valyuta[3].rate!))
                                                .toString()
                                      }
                                    :
                                {
                                  controller4.clear(),
                                  controller1.clear(),
                                  controller2.clear(),
                                  controller3.clear()
                                };

                              },
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Expanded(child: Text("O'zbekiston so'mi")),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).cardColor,
                      ),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("images/${logo[0]}"),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: size.width * .5,
                            child: TextField(
                              controller: controller1,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: InputDecoration(
                                hintText: valyuta[0].ccy!,
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  log = "images/${logo[0]}";
                                });
                                controller1.text != ''
                                    ? {
                                        controller0.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[0].rate!))
                                                .toString(),
                                        controller2.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[0].rate!) /
                                                    double.parse(
                                                        valyuta[1].rate!))
                                                .toString(),
                                        controller3.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[0].rate!) /
                                                    double.parse(
                                                        valyuta[2].rate!))
                                                .toString(),
                                        controller4.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[0].rate!) /
                                                    double.parse(
                                                        valyuta[3].rate!))
                                                .toString()
                                      }
                                    : {
                                        controller0.clear(),
                                        controller4.clear(),
                                        controller2.clear(),
                                        controller3.clear()
                                      };
                              },
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Expanded(child: Text(valyuta[0].ccyNmUZ!)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).cardColor,
                      ),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("images/${logo[1]}"),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: size.width * .5,
                            child: TextField(
                              controller: controller2,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: InputDecoration(
                                hintText: valyuta[1].ccy!,
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  log = "images/${logo[1]}";
                                });
                                controller2.text != ''
                                    ? {
                                        controller0.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[1].rate!))
                                                .toString(),
                                        controller1.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[1].rate!) /
                                                    double.parse(
                                                        valyuta[0].rate!))
                                                .toString(),
                                        controller3.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[1].rate!) /
                                                    double.parse(
                                                        valyuta[2].rate!))
                                                .toString(),
                                        controller4.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[1].rate!) /
                                                    double.parse(
                                                        valyuta[3].rate!))
                                                .toString()
                                      }
                                    : {
                                        controller0.clear(),
                                        controller1.clear(),
                                        controller4.clear(),
                                        controller3.clear(),
                                      };
                              },
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Expanded(child: Text(valyuta[1].ccyNmUZ!)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).cardColor,
                      ),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("images/${logo[2]}"),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: size.width * .5,
                            child: TextField(
                              controller: controller3,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: InputDecoration(
                                hintText: valyuta[2].ccy!,
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  log = "images/${logo[2]}";
                                });
                                controller3.text != ''
                                    ? {
                                        controller0.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[2].rate!))
                                                .toString(),
                                        controller2.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[2].rate!) /
                                                    double.parse(
                                                        valyuta[1].rate!))
                                                .toString(),
                                        controller1.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[2].rate!) /
                                                    double.parse(
                                                        valyuta[0].rate!))
                                                .toString(),
                                        controller4.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[2].rate!) /
                                                    double.parse(
                                                        valyuta[3].rate!))
                                                .toString()
                                      }
                                    : {
                                        controller0.clear(),
                                        controller1.clear(),
                                        controller2.clear(),
                                        controller4.clear(),
                                      };
                              },
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Expanded(child: Text(valyuta[2].ccyNmUZ!)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).cardColor,
                      ),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("images/${logo[3]}"),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: size.width * .5,
                            child: TextField(
                              controller: controller4,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: InputDecoration(
                                hintText: valyuta[3].ccy!,
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  log = "images/${logo[3]}";
                                });
                                controller4.text != ''
                                    ? {
                                        controller0.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[3].rate!))
                                                .toString(),
                                        controller2.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[3].rate!) /
                                                    double.parse(
                                                        valyuta[1].rate!))
                                                .toString(),
                                        controller3.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[3].rate!) /
                                                    double.parse(
                                                        valyuta[2].rate!))
                                                .toString(),
                                        controller1.text =
                                            (double.parse(value) *
                                                    double.parse(
                                                        valyuta[3].rate!) /
                                                    double.parse(
                                                        valyuta[0].rate!))
                                                .toString(),
                                      }
                                    : {
                                        controller0.clear(),
                                        controller1.clear(),
                                        controller2.clear(),
                                        controller3.clear(),
                                      };
                              },
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Expanded(child: Text(valyuta[3].ccyNmUZ!)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

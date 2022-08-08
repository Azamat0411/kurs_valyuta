import 'package:flutter/material.dart';
import '../api_service.dart';
import '../kurs.dart';

class OthersScreen extends StatefulWidget {
  const OthersScreen({Key? key}) : super(key: key);

  @override
  _OthersScreenState createState() => _OthersScreenState();
}

class _OthersScreenState extends State<OthersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text("Boshqalar", style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color,),),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: FutureBuilder<List<Kurs>>(
              future: fetchKurs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: false,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        snapshot.data![index].ccy!,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        snapshot.data![index].ccyNmUZ!,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(snapshot.data![index].rate!),
                                      Row(
                                        children: [
                                          Text(
                                            snapshot.data![index].diff!,
                                            style: TextStyle(
                                                color: snapshot
                                                    .data![index].diff!
                                                    .substring(0, 1) ==
                                                    "-"
                                                    ? Colors.red
                                                    : Colors.green),
                                          ),
                                          snapshot.data![index].diff!
                                              .substring(0, 1) ==
                                              "-"
                                              ? const Icon(
                                            Icons.arrow_downward,
                                            color: Colors.red,
                                          )
                                              : const Icon(
                                            Icons.arrow_upward,
                                            color: Colors.green,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator(color: Colors.red,));
              },
            ),
          ),
        ],
      ),
    );
  }
}

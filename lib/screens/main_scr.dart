import 'package:flutter/material.dart';
import '../api_service.dart';
import '../const.dart';
import '../kurs.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorbg = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: colorbg,
        centerTitle: true,
        title: Text("Asosiy", style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color,),),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Kurs>>(
              future: fetchKurs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: 4,
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
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                    AssetImage("images/${logo[index]}"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    snapshot.data![index].ccy!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../connectivity_provider.dart';

class NoInternet extends StatefulWidget {
  final Widget child;
  const NoInternet({Key? key, required this.child}) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectivityProvider>(
      builder: (context, model, child) {
        return model.isOnline
            ? widget.child
            : Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Image.asset("images/noInternet.png")),
                const SizedBox(height: 20),
                const Text(
                  "Internet aloqasi uzilgan",
                  style: TextStyle(
                      fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50,),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class FuturePage extends StatelessWidget {
  FuturePage({super.key});

  getData() {
    return Future.delayed(const Duration(seconds: 5), () {
      // var sortName = name.sort((a, b) => a.length.compareTo(b.length));
      return name;
      // throw Exception("Custom Error");
    });
  }

  List name = [
    "Allahabad",
    "Ghaziabad",
    "Varanasi",
    "Fatehpure",
    "Jaunpur",
    "Jhansi"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Builder"),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              } else if (snapshot.hasData) {
                final data = snapshot.data;
                return ListView.builder(
                    itemCount: name.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [Card(child: Text(name[i]))],
                      );
                    });
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

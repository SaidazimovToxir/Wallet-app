import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_35/datewidget.dart';
import 'package:lesson_35/feruza.dart';
import 'package:lesson_35/mardon.dart';
import 'package:lesson_35/widgets/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Mening Hamyonim'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  List<Map<String, dynamic>> transactionList = [];
  double currentPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Gap(20.0),
          Mardon(
            title: currentPrice.toString(),
          ),
          const Gap(50.0),
          Feruza(
            currentAmount: currentPrice,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                itemCount: transactionList.length,
                itemBuilder: (context, i) {
                  // print(currentPrice);
                  return Transactions(
                    title: transactionList[i]['name'],
                    date: transactionList[i]['date'],
                    price: transactionList[i]['price'],
                    color: transactionList[i]['color'],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final informations = await showModalBottomSheet<Map<String, dynamic>>(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext ctx) {
              return Datewidget();
            },
          );

          if (informations != null) {
            setState(
              () {
                transactionList.add(informations);
              },
            );
            currentPrice += double.parse(informations['price']);
            // money.add(currentPrice);
            // print(money);
          }
        },
      ),
    );
  }
}

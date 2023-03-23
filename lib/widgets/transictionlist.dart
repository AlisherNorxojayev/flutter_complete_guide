import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import '../models/models.dart';

class TransictionList extends StatelessWidget {
  final List<Transaction> transiction;
  const TransictionList({super.key, required this.transiction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: transiction.isEmpty
          ? Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "No transiction added yet!",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image.asset("assets/images/waiting.png"),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                            child: Text("\$" + " " +
                              transiction[index].amount.toStringAsFixed(2),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        transiction[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(DateFormat.yMMMEd().format(transiction[index].date)),
                    ),
                  ),
                );
              },
              itemCount: transiction.length,
            ),
    );
  }
}

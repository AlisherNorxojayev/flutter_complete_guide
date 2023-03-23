import 'dart:ffi';

import 'package:flutter/material.dart';

class NewTransiction extends StatefulWidget {
  Function addTx;
  NewTransiction(this.addTx);

  @override
  State<NewTransiction> createState() => _NewTransictionState();
}

class _NewTransictionState extends State<NewTransiction> {
  TextEditingController _controller = TextEditingController();

  TextEditingController _controller2 = TextEditingController();

  void _addTransiction() {
    final title = _controller.text;
    final amount = double.parse(_controller2.text);
    if (title == "" || amount <= 0) {
      return;
    }
    widget.addTx(title, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(label: Text("Title")),
              onSubmitted: (value) => _addTransiction(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _controller2,
              decoration: InputDecoration(label: Text("Amount")),
              onSubmitted: (value) => _addTransiction(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text("No Date Chose!"),
                  TextButton(onPressed: (){}, child: Text("Chosen Date",))
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () => _addTransiction(),
                child: Text("New Transiction",style: TextStyle(fontWeight: FontWeight.bold),))
          ],
        ),
      ),
    );
  }
}

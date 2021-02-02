import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleControler = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: titleControler,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) {
              //   amountInput = val;
              // },
              controller: amountController,
            ),
            FlatButton(
              onPressed: () {
                addTx(
                  titleControler.text,
                  double.parse(amountController.text),
                );
              },
              textColor: Colors.purple,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}

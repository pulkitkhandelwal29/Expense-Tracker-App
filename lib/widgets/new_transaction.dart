import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  //Binding addTx to the function parameter
  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      //wrapping column into container to provide more styling
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //receive user input
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            FlatButton(
                onPressed: () {
                  addTx(
                    titleController.text,
                    //converts string number to text
                    double.parse(amountController.text),
                  );
                },
                child: Text('Add Transaction'),
                textColor: Colors.purple),
          ],
        ),
      ),
    );
  }
}

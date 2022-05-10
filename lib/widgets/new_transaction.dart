import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  //Binding addTx to the function parameter
  NewTransaction(this.addTx);

  //add transaction button
  void submitData() {
    final enteredTitle = titleController.text;
    //converts string number to text
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      //return stops the later code not working
      return;
    }
    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              //to get keyboard with only numeric keypad
              keyboardType: TextInputType.number,
              //need a value to be accepted, so just _ is taking the value but not using it
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
                onPressed: submitData,
                child: Text('Add Transaction'),
                textColor: Colors.purple),
          ],
        ),
      ),
    );
  }
}

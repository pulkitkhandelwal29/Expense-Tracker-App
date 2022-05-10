import 'package:flutter/material.dart';

//stateful widet as new transaction does not lose data in modal sheet
class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  //add transaction button
  void submitData() {
    final enteredTitle = titleController.text;
    //converts string number to text
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      //return stops the later code not working
      return;
    }
    //because of this we can access properties of widget class from state class
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    //close the focused screen i.e. modal sheet when its work is done
    Navigator.of(context).pop();
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

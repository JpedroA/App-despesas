import 'package:flutter/material.dart';

class TransactionsForm extends StatelessWidget {
  TransactionsForm(addTransaction, {super.key, this.onSubmit});
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final Function(String, double)? onSubmit;

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    onSubmit!(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            controller: titleController,
            onSubmitted: (_) => _submitForm(),
            decoration: const InputDecoration(labelText: 'Titulo'),
          ),
          TextField(
            controller: valueController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => _submitForm(),
            decoration: const InputDecoration(labelText: 'Valor (R\$)'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _submitForm(),
                child: const Text("nova Transaçao",
                    style: TextStyle(color: Colors.purple)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

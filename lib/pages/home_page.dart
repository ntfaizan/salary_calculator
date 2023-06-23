import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final grossSalaryController = TextEditingController();
  final taxController = TextEditingController();
  double? netSalary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gross Salary'),
            TextField(
              controller: grossSalaryController,
            ),
            Text('Income Tax'),
            TextField(
              controller: taxController,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: FilledButton.icon(
                    onPressed: () {
                      // if(grossSalaryController.text.trim().isEmpty){
                      //   return;
                      // }
                      double grossSalary =
                          double.parse(grossSalaryController.text);
                      double tax =
                          grossSalary * double.parse(taxController.text) / 100;
                      netSalary = grossSalary - tax;
                      setState(() {});
                    },
                    icon: const Icon(Icons.done),
                    label: const Text('Calculate'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.clear),
                    label: const Text('Clear'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (netSalary != null) Text('Net Salary: $netSalary'),
          ],
        ),
      ),
    );
  }
}

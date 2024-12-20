import 'package:flutter/material.dart';

void main() {
  runApp(MySalaryApp());
}

class MySalaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        hintColor: Colors.green,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
        ),
      ),
      home: SalaryCalculatorScreen(),
    );
  }
}

class SalaryCalculatorScreen extends StatefulWidget {
  @override
  _SalaryCalculatorScreenState createState() => _SalaryCalculatorScreenState();
}

class _SalaryCalculatorScreenState extends State<SalaryCalculatorScreen> {
  final TextEditingController _hoursController = TextEditingController();
  String _result = '';

  double calculateSalary(int hours) {
    if (hours <= 40) {
      return hours * 400;
    } else {
      int extraHours = hours - 40;
      return (40 * 400) + (extraHours * 600);
    }
  }

  void handleCalculate() {
    final int hours = int.tryParse(_hoursController.text) ?? 0;
    final double salary = calculateSalary(hours);

    setState(() {
      _result = 'Total Salary: Tk $salary';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salary Calculator'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.lightBlue[50], // Set background color
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Hours Worked',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _hoursController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'E.g., 35..45',
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: handleCalculate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Button color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Calculate Salary',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (_result.isNotEmpty)
                Text(
                  _result,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

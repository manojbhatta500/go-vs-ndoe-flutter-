import 'package:flutter/material.dart';
import 'package:flutterapp/go_cubit/go_cubit_cubit.dart';
import 'package:flutterapp/node_cubit/node_cubit_cubit.dart';
import 'package:flutterapp/pages/go_api.dart';
import 'package:flutterapp/pages/node_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => GoCubitCubit(),
      ),
      BlocProvider(
        create: (context) => NodeCubitCubit(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Comparison',
      home: TestScreen(),
    ),
  ));
}

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Node Vs Go'),
        backgroundColor: Colors.blue, // Set app bar background color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<NodeCubitCubit>(context).hitNodeServer();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NodeApiTestScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set button background color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Test Node.js API',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<GoCubitCubit>(context).hitGoServer();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GolangApiTestScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set button background color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Test Golang API',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

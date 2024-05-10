import 'package:flutter/material.dart';
import 'package:flutterapp/go_cubit/go_cubit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GolangApiTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Golang API Test'),
        backgroundColor: Colors.blue, // Set app bar background color
      ),
      body: BlocBuilder<GoCubitCubit, GoCubitState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case GoCubitLoading:
              return Column(
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  Text("Analyzing ......")
                ],
              );
            case GoCubitFailed:
              return Column(
                children: [Text("SomeThing failed")],
              );
            case GoCubitSuccess:
              final data = state as GoCubitSuccess;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Server Response : ${data.data.message}"),
                    Text("Processing Response : ${data.data.processingTime}"),
                  ],
                ),
              );
            default:
              return Text("default");
          }
        },
      ),
    );
  }
}

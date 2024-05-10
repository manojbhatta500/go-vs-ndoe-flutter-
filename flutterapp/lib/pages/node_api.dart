import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/go_cubit/go_cubit_cubit.dart';
import 'package:flutterapp/node_cubit/node_cubit_cubit.dart';

class NodeApiTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Node.js API Test'),
        backgroundColor: Colors.blue, // Set app bar background color
      ),
      body: BlocBuilder<NodeCubitCubit, NodeCubitState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case NodeCubitLoading:
              return Column(
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  Text("Analyzing ......")
                ],
              );
            case NodeCubitFailed:
              return Column(
                children: [Text("SomeThing failed")],
              );
            case NodeCubitSuccess:
              final data = state as NodeCubitSuccess;
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

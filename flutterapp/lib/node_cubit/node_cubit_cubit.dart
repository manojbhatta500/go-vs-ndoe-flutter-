import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutterapp/model/response_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'node_cubit_state.dart';

class NodeCubitCubit extends Cubit<NodeCubitState> {
  NodeCubitCubit() : super(NodeCubitInitial());

  void hitNodeServer() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/node'));
      emit(NodeCubitLoading());

      log(response.toString());

      if (response.statusCode == 200) {
        final responseBody = response.body;

        log(responseBody);
        final responseData = jsonDecode(responseBody);
        final message = responseData['message'];
        final processingTime = responseData['processingTime'];
        final responseModel = ResponseModel(
          message: message,
          processingTime: processingTime,
        );
        emit(NodeCubitSuccess(data: responseModel));
      } else {
        emit(NodeCubitFailed());
      }
    } catch (e) {
      emit(NodeCubitFailed());
    }
  }
}

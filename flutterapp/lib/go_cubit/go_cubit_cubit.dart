import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutterapp/model/response_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'go_cubit_state.dart';

class GoCubitCubit extends Cubit<GoCubitState> {
  GoCubitCubit() : super(GoCubitInitial());

  void hitGoServer() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:8080/go'));

      emit(GoCubitLoading());

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
        emit(GoCubitSuccess(data: responseModel));
      } else {
        emit(GoCubitFailed());
      }
    } catch (e) {
      emit(GoCubitFailed());
    }
  }
}

part of 'go_cubit_cubit.dart';

@immutable
sealed class GoCubitState {}

final class GoCubitInitial extends GoCubitState {}

final class GoCubitLoading extends GoCubitState {}

final class GoCubitSuccess extends GoCubitState {
  ResponseModel data;
  GoCubitSuccess({required this.data});
}

final class GoCubitFailed extends GoCubitState {}

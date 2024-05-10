part of 'node_cubit_cubit.dart';

@immutable
sealed class NodeCubitState {}

final class NodeCubitInitial extends NodeCubitState {}

final class NodeCubitSuccess extends NodeCubitState {
  ResponseModel data;
  NodeCubitSuccess({required this.data});
}

final class NodeCubitLoading extends NodeCubitState {}

final class NodeCubitFailed extends NodeCubitState {}

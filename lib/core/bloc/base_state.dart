import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();
}

class InitialState extends BaseState {
  const InitialState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

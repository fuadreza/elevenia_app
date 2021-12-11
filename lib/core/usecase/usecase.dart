
import 'package:equatable/equatable.dart';

abstract class UseCase<Params, Type> {
  Future<Type> invoke(final Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

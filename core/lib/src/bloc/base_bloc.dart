import 'package:core/core.dart';
import 'package:core/src/bloc/base_bloc_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_event.dart';
part 'base_state.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends BaseBlocDelegate<E, S> with EventTransformerMixin, LogMixin {
  BaseBloc(super.initialState);

  @override
  void on<Ev extends E>(
    EventHandler<Ev, S> handler, {
    EventTransformer<Ev>? transformer,
  }) {
    super.on<Ev>(
      handler,
      transformer: transformer ?? log(),
    );
  }
}

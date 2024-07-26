import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/base_bloc.dart';
import '../bloc/base_event.dart';
import '../bloc/base_state.dart';
import '../dependencies/app_dependencies.dart';

abstract class BaseView<B extends BaseBloc> extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: BlocProvider<B>(
        create: (context) => (createBloc() ?? AppDependencies.injector.get<B>()),
        child: BlocConsumer<B, BaseState>(
          builder: (context, state) {
            BaseState renderState = state;
            if (state is InitialState) {
              context.read<B>().add(InitialEvent());
            }
            return buildView(context, renderState);
          },
          listener: (context, state) {
            handleState(context, state);
          },
          buildWhen: (BaseState previous, BaseState current) {
            return rebuildViewWhen(previous, current);
          },
        ),
      ),
    );
  }

  bool rebuildViewWhen(BaseState previous, BaseState current) => true;

  B? createBloc() => null;

  void handleState(BuildContext context, BaseState state) {}

  Widget buildView(BuildContext context, BaseState state);
}

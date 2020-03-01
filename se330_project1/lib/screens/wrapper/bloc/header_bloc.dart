import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:se330_project1/screens/wrapper/screen_header.dart';
import 'package:equatable/equatable.dart';

part 'header_event.dart';
part 'header_state.dart';

class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  @override
  HeaderState get initialState => HeaderInitial();

  @override
  Stream<HeaderState> mapEventToState(
    HeaderEvent event,
  ) async* {
    if (event is ChangeHeader) {
      yield DisplayingHeader(event.header);
    } else {
      yield HeaderInitial();
    }
  }
}

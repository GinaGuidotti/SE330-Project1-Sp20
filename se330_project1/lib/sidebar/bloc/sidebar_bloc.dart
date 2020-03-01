import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sidebar_event.dart';
part 'sidebar_state.dart';

class SidebarBloc extends Bloc<SidebarEvent, SidebarState> {
  @override
  SidebarState get initialState => SidebarInitial();

  @override
  Stream<SidebarState> mapEventToState(
    SidebarEvent event,
  ) async* {
    if (event is ToggleSidebar) { 
      if (state is SidebarDisplayed) {
      print('Was Displayed now Hidden');
        yield SidebarHidden();
      } else if (state is SidebarHidden) {
      print('Was Hidden now Displayed');
        yield SidebarDisplayed();
      } else if (state is SidebarInitial) {
        print('Inside Initial Click');
        yield SidebarDisplayed();
      } else {
      print('Inside Else');
        yield SidebarHidden();
      }
    }
  }
}

part of 'sidebar_bloc.dart';

abstract class SidebarEvent extends Equatable {
  const SidebarEvent();
}

class ToggleSidebar extends SidebarEvent {
  const ToggleSidebar();
  @override
  List<Object> get props => [];
}

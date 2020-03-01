part of 'sidebar_bloc.dart';

abstract class SidebarState extends Equatable {
  const SidebarState();
}

class SidebarInitial extends SidebarState {
  @override
  List<Object> get props => [];
}

class SidebarDisplayed extends SidebarState {
  @override
  List<Object> get props => [];
}

class SidebarHidden extends SidebarState {
  @override
  List<Object> get props => [];
}
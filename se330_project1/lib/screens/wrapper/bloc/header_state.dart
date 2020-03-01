part of 'header_bloc.dart';

abstract class HeaderState extends Equatable {
  final ScreenHeader currentHeader;
  HeaderState() : currentHeader = DefaultHeader();
}

class HeaderInitial extends HeaderState {
  final ScreenHeader currentHeader;
  HeaderInitial() : currentHeader = DefaultHeader();
  @override
  List<Object> get props => [currentHeader.headerText];
}

class DisplayingHeader extends HeaderState {
  final ScreenHeader currentHeader;
  DisplayingHeader(this.currentHeader);
  @override
  List<Object> get props => [currentHeader.headerText];
}
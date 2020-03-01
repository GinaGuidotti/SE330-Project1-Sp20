part of 'header_bloc.dart';

abstract class HeaderEvent extends Equatable {
  const HeaderEvent();
}

class ChangeHeader extends HeaderEvent {
  final ScreenHeader header;
  ChangeHeader({this.header});
  @override
  List<Object> get props => [this.header];
}


import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class ToggleThemeEvent extends ThemeEvent {
  const ToggleThemeEvent();
}

class SetThemeModeEvent extends ThemeEvent {
  final bool isDarkMode;
  const SetThemeModeEvent(this.isDarkMode);

  @override
  List<Object?> get props => [isDarkMode];
}

part of 'settings_cubit.dart';

@immutable
final class SettingsState extends Equatable {
  const SettingsState({
    this.isFileGrouping = true,
    this.isRawGrouping = true,
  });
  final bool isFileGrouping, isRawGrouping;

  SettingsState copyWith({bool? isFileGrouping, bool? isRawGrouping}) =>
      SettingsState(
        isFileGrouping: isFileGrouping ?? this.isFileGrouping,
        isRawGrouping: isRawGrouping ?? this.isRawGrouping,
      );

  @override
  List<Object?> get props => [isFileGrouping, isRawGrouping];
}

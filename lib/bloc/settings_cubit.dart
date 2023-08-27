import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void setIsFileGrouping(bool value) =>
      emit(state.copyWith(isFileGrouping: value));

  void setIsRawGrouping(bool value) =>
      emit(state.copyWith(isRawGrouping: value));
}

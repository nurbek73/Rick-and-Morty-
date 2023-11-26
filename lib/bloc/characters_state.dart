part of 'characters_bloc.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoading extends CharactersState {}

final class CharactersSuccess extends CharactersState {
  final CharactersModel model;

  CharactersSuccess({required this.model});
}

final class CharactersError extends CharactersState {
  final String errorText;

  CharactersError({required this.errorText});
}

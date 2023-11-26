part of 'characters_bloc.dart';

@immutable
sealed class CharactersEvent {}

final class GetCharactersDataEvent extends CharactersEvent {
  final String? name;
  final String? status;
  final String? gender;
  final String? species;
  final String? page;

  GetCharactersDataEvent({
    this.gender,
    this.name,
    this.species,
    this.status,
    this.page,
  });
}

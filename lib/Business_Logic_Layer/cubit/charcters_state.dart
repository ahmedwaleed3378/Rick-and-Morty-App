part of 'charcters_cubit.dart';

@immutable
// abstract class CharactersState {}

// class CharactersInitial extends CharactersState {}

// class CharactersLoaded extends CharactersState {
//   final List<Character>characters;

//   CharactersLoaded(this.characters);
// }
// // class QoutesLoaded extends CharactersState {
// //   final List<Qoute>qoutes;

// //   QoutesLoaded(this.qoutes);
// //} 

// part of 'charcters_cubit.dart';

// @immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}


class CharactersLoaded extends CharactersState {
  final List<Character> characters;

  CharactersLoaded(this.characters);
}

class QuotesLoaded extends CharactersState {
  final List<Qoute> quotes;

  QuotesLoaded(this.quotes);
}

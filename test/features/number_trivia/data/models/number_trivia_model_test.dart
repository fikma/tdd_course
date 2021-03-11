import 'dart:convert';

import 'package:clean_architecture_tdd_course/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTriviaNumberModel = NumberTriviaModel(
    number: 3,
    text: '3.457e+181 is the number of ways to arrange the tiles in English Scrabble on a standard 15-by-15 Scrabble board.');

  test('should be a subclass of NumberTrivia entity', 
      () async {
        expect(tTriviaNumberModel, isA<NumberTrivia>());
      });
  group(
    'from json', () {
      test(
        'should return a valid model when the json number is an integer',
        () async {
          // arrange
          final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia.json'));
          // act
          final result = NumberTriviaModel.fromJson(jsonMap);
          // assert
          expect(result, tTriviaNumberModel);
        });
      
      test(
        'should return a valid model when the json number is regarded as a double',
        () async {
          // arrange
          final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia_double.json'));
          // act
          final result = NumberTriviaModel.fromJson(jsonMap);
          // assert
          expect(result, tTriviaNumberModel);
        });
    });

    group('to json', () {
      test('should return a JSON map containing the propper data',
      () async {
        // act
        final result = tTriviaNumberModel.toJson();
        // assert
        final expectedMap = {
          "text": "3.457e+181 is the number of ways to arrange the tiles in English Scrabble on a standard 15-by-15 Scrabble board.",
          "number": 3
        };
        expect(result, expectedMap);
      });
    });
}
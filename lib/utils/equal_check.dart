import 'package:math_expressions/math_expressions.dart';

String equalCheck(String question) {
  question = question.replaceAll('x', '*');
  Parser p = Parser();
  Expression exp = p.parse(question);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  return eval.toString();
}

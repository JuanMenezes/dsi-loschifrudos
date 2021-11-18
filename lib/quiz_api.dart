import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'questions.dart';

class QuizApi {
  Future<List<Question>> getData() async {
    try {
      var url =
          'https://script.google.com/macros/s/AKfycbyDArY1iozUMgDugJXn_Q_hOdap9yAB5vmAs62BkegulcyLwSTgVB-68uerjgs9fnUQgg/exec';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Question>.from(data["questions"].map(
            (x) => Question(answer1: x, answer2: x, question: x).fromMap(x)));
      } else {
        List<Question> a = [];
        return a;
      }
    } catch (error) {
      print(error);
      List<Question> a = [];
      return a;
    }
  }
}

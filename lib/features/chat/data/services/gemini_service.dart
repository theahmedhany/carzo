import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final model = GenerativeModel(
    // model: 'gemini-exp-1206',
    // model: 'gemini-pro',
    // model: 'gemini-1.5-pro',
    model: 'gemini-1.5-flash',
    apiKey: 'AIzaSyCDzH32RrvnG4zqDFH6UxVkwf2763qcOtM',
  );

  Future<String> generateResponse(String prompt) async {
    try {
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      return response.text ?? 'No response';
    } catch (e) {
      throw Exception('Error generating response: $e');
    }
  }
}

import 'package:test/test.dart';
import 'package:orion_gem_nest_dart_client/orion_gem_nest_dart_client.dart';


/// tests for GeminiApi
void main() {
  final instance = OrionGemNestDartClient().getGeminiApi();

  group(GeminiApi, () {
    // Basic prompt
    //
    //Future<String> geminiControllerBasicPrompt(BasicPromptDto basicPromptDto) async
    test('test geminiControllerBasicPrompt', () async {
      // TODO
    });

    // Basic prompt stream
    //
    //Future<String> geminiControllerBasicPromptStream(BasicPromptDto basicPromptDto) async
    test('test geminiControllerBasicPromptStream', () async {
      // TODO
    });

  });
}

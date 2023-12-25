import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:voice_assistant/secrets.dart';
class OpenAIService{
  final List<Map<String,String>> messages=[];

  Future<String>  isArtPromptAPI(String prompt) async{
    messages.add({
      'role':'user',
      'content': prompt,
    });
    try{

      final res= await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAiAPIKey',
        },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": messages,
      })
      );

      if(res.statusCode==200) {
        String content = jsonDecode(
            res.body)['choices'][0]['message']['content'];
        content = content.trim();

         messages.add({
               'role': 'assistant',
               'content': content,
         });
      }
      return 'An internal error occurred';
    }catch(e){
        return e.toString();
    }

  }
  Future<String>  chatGPTAPI(String prompt) async{
           return 'CHATGPT';
  }
  Future<String>  dallEAPI(String prompt) async{
    messages.add({
      'role':'user',
      'content': prompt,
    });
    try{

      final res= await http.post(
          Uri.parse('https://api.openai.com/v1/images/generations'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $openAiAPIKey',
          },
          body: jsonEncode({
             'prompt': prompt,
            'n':1,
          })
      );

      if(res.statusCode==200) {
        String imageURL = jsonDecode(
            res.body)['data'][0]['url'];
        imageURL = imageURL.trim();

        messages.add({
          'role': 'assistant',
          'content':imageURL,
        });
        return imageURL;
      }
      return 'An internal error occurred';
    }catch(e){
      return e.toString();
    }
  }

}
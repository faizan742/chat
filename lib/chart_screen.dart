import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'chart_message.dart';
class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
//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
  final TextEditingController _controller= TextEditingController();
  List<ChartMessage> message=[];

  Future<String> getChatGPTResponse(String question) async {
    String endpoint = 'https://api.openai.com/v1/chat/completions';
    String apiKey = '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'; // Replace with your actual OpenAI API key

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
      'OpenAI-Organization': 'org-24HvU5m6A0rs4z6q99IKzSeq',
    };

    Map<String, dynamic> data = {
      'prompt': question,
      'max_tokens': 50,
    };

    String jsonData = jsonEncode(data);

    http.Response response = await http.post(
      Uri.parse(endpoint),
      headers: headers,
      body: jsonData,
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      String answer = jsonResponse['choices'][0]['text'];
      print(answer) ;
      return "hi";
    } else {
      print('Request failed with status: ${response.statusCode}');
      return '';
    }
  }


  void sendMessage()
  {
    ChartMessage chart_message=ChartMessage(sender: "user", message: _controller.text);
    setState(() {
      message.insert(0, chart_message);
    });
    print("hi");
    getChatGPTResponse(message[0].message);
    _controller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chart GPT"),centerTitle: true,),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    padding:  EdgeInsets.all(16),
                    itemCount: message.length,
                itemBuilder: (context,index)
                    {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(

                           child: message[index],

                        ),
                      );
                    }
                )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,

                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,

                    ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: _buildTextComposer(),
              ),
            )
          ],
        ),

      ),
      drawer: Drawer(),
    );
 
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => sendMessage(),

            decoration: InputDecoration.collapsed(
                hintText: "   Question/description"),
          ),
        ),
        IconButton(onPressed: sendMessage, icon: Icon(Icons.send,color: Colors.black,))
      ],
    );
  }
  
}



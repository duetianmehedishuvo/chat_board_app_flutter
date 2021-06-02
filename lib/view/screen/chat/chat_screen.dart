import 'dart:ui';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:tutorial/data/model/response/chatModel.dart';
import 'package:tutorial/localization/language_constrants.dart';
import 'package:tutorial/provider/chat_provider.dart';
import 'package:tutorial/util/color_resources.dart';
import 'package:tutorial/util/image.dart';
import 'package:tutorial/util/styles.dart';
import 'package:tutorial/view/widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  stt.SpeechToText _speech;
  bool _isListening = false;

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() async {
            controller.text = val.recognizedWords.toString();
            if (val.finalResult) {
              setState(() => _isListening = false);
              await _speech.stop();
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      await _speech.stop();
    }
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    Provider.of<ChatProvider>(context, listen: false).initializeChatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ChatProvider>(
          builder: (context, chatProvider, child) {
            return Container(
              color: ColorResources.COLOR_PRIMARY,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(getTranslated('city_university_chat_app', context), style: rubikBold.copyWith(color: Colors.white)),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(color: Color(0x24FFFFFF), borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(_isListening ? Icons.mic : Icons.mic_off, color: Colors.white),
                              onPressed: () {
                                _listen();
                              },
                            ),


                            Expanded(
                              child: TypeAheadField(
                                noItemsFoundBuilder: (context)=>Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'I am still learning when I learn all then I can give you this information, Thank you.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 18.0),
                                  ),
                                ),
                                textFieldConfiguration: TextFieldConfiguration(
                                    controller: controller,
                                    style: rubikMedium.copyWith(color: Colors.white),
                                    enableInteractiveSelection: false,
                                    decoration: InputDecoration(
                                      hintText: 'Write something for ask question',
                                      hintStyle: TextStyle(color: Color(0x56FFFFFF), fontSize: 12),
                                      border: InputBorder.none,
                                      filled: true,
                                    )),
                                suggestionsCallback: (pattern) async {
                                  return chatProvider.getSuggestions(pattern);
                                },
                                itemBuilder: (context, suggestion) {
                                  return Card(
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            suggestion.toString(),
                                            style: rubikRegular,
                                          )));
                                },
                                onSuggestionSelected: (suggestion) {
                                  controller.text = suggestion.toString();
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.send, color: Colors.white),
                              onPressed: () {
                                chatProvider.queryAns(controller.text, context);
                                controller.clear();
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_WHITE,
                        image: DecorationImage(image: new ExactAssetImage(Images.city_university), fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
                    child: chatProvider.allChatData.length > 0
                        ? ListView.builder(
                            reverse: true,
                            padding: EdgeInsets.all(10),
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: chatProvider.allChatData.length,
                            itemBuilder: (context, index) {
                              List<ChatModel> reversed = chatProvider.allChatData.reversed.toList();
                              return MessageBubble(isMe: reversed[index].isMe, text: reversed[index].message);
                            },
                          )
                        : Center(
                            child: Text(
                            getTranslated('message_is_empty', context),
                            style: rubikRegular.copyWith(fontSize: 15),
                          )),
                  ),
                ),
              ]),
            );
          },
        ),
      ),
    );
  }
}

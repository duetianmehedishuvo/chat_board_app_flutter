import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tutorial/data/model/response/chatModel.dart';
import 'package:tutorial/data/repository/chat_repo.dart';
import 'package:tutorial/localization/language_constrants.dart';
import 'package:tutorial/view/widgets/custom_snackbar.dart';

class ChatProvider extends ChangeNotifier {
  final ChatRepo chatRepo;

  ChatProvider({@required this.chatRepo});

  List<ChatModel> _allChatData = [];

  List<ChatModel> get allChatData => _allChatData;
  int _selectIndex = 0;

  void queryAns(String query, BuildContext context) {
    _selectIndex = 0;

    chatRepo.getChatListQuestion().forEach((element) {
      if ((element.message.toLowerCase().contains(query.toLowerCase())) && _selectIndex == 0) {
        _allChatData.add(element);
        _allChatData.add(chatRepo.getChatListAnswer()[element.messageID]);
        _selectIndex = 1;
      }
    });
    if (_selectIndex == 0) showCustomSnackBar(getTranslated('data_not_found', context), context);
    notifyListeners();
  }

  // for auto suggesstion

  void initializeChatData() {
    chatRepo.getChatListQuestion();
    chatRepo.getChatListAnswer();
    notifyListeners();
  }

//find and create list of matched strings
  List<String> getSuggestions(String query) {
    List<String> matches = [];
    chatRepo.getChatListQuestion().forEach((element) {
      matches.add(element.message);
    });
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

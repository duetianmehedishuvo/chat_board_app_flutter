import 'package:tutorial/data/model/response/chatModel.dart';

class ChatRepo {
  List<ChatModel> getChatListQuestion() {
    List<ChatModel> questionList = [
      ChatModel('Hi', true, 0),
      ChatModel('Question 01', true, 1),
      ChatModel('Question 02', true, 2),
      ChatModel('Question 03', true, 3),
      ChatModel('Question 04', true, 4),
      ChatModel('Question 05', true, 5),
      ChatModel('আমার', true, 6),
      ChatModel('স্কুল', true, 7),
      ChatModel('বাড়ি', true, 8),
      ChatModel('আমাদের গ্রাম অনেক সুন্দর', true, 9),
    ];
    return questionList;
  }

  List<ChatModel> getChatListAnswer() {
    List<ChatModel> answerList = [
      ChatModel('Hi Shuvo', false, 0),
      ChatModel('Answer 01', false, 1),
      ChatModel('Answer 02', false, 2),
      ChatModel('Answer 03', false, 3),
      ChatModel('Answer 04', false, 4),
      ChatModel('Answer 05', false, 5),
      ChatModel('বাড়ি নাই', false, 6),
      ChatModel('ডুয়েট', false, 7),
      ChatModel('নাই', false, 8),
      ChatModel('সত্তি!', false, 9),
    ];
    return answerList;
  }
}

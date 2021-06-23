import 'package:tutorial/data/model/response/chatModel.dart';

class ChatRepo {

  List<ChatModel> getChatListQuestion() {
    List<ChatModel> questionList = [
      ChatModel('Hi', true, 0),
      ChatModel('hello', true, 1),
      ChatModel('where is city university', true, 2),
      ChatModel('how many department city university have', true, 3),
      ChatModel('do you have cse department', true, 4),
      ChatModel('where is khagan', true, 5),
      ChatModel('city university কোথায়?', true, 6),
      ChatModel('city বিশ্ববিদ্যালয় কত বিভাগ আছে', true, 7),
      ChatModel('do you have evening shift facility', true, 8),
      ChatModel('  সন্ধ্যা শিফট সুবিধা কি আছে?', true, 9),
    ];
    return questionList;
  }

  List<ChatModel> getChatListAnswer() {
    List<ChatModel> answerList = [
      ChatModel('Hi', false, 0),
      ChatModel('hello', false, 1),
      ChatModel('there are two campus of city university in AShulia,Khagan bazar its main campus and panthopath its city campus ', false, 2),
      ChatModel('there are eight department we have', false, 3),
      ChatModel('yes we have cse department', false, 4),
      ChatModel('khagan is in Ashulia', false, 5),
      ChatModel(' সিটি বিশ্ববিদ্যালয়ের দুটি ক্যাম্পাস রয়েছে,আশুলিয়ায় খাগান বাজার এর প্রধান ক্যাম্পাস এবং city ক্যাম্পাস পান্থোপাথ রয়েছে', false, 6),
      ChatModel('আমাদের আটটি বিভাগ আছে', false, 7),
      ChatModel('yes we have evening shift fcility', false, 8),
      ChatModel('হ্যাঁ আমাদের সন্ধ্যায় শিফট রয়েছে', false, 9),
    ];
    return answerList;
  }
}

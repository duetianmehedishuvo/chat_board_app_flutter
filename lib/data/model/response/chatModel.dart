class ChatModel {
  String _message;
  bool _isMe;
  int _messageID;

  ChatModel(this._message, this._isMe,this._messageID);

  bool get isMe => _isMe;
  String get message => _message;
  int get messageID => _messageID;
}
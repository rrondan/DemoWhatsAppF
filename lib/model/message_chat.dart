class MessageChat {
  String message;
  String name;

  MessageChat({required this.message, required this.name});

  factory MessageChat.fromJson(Map<String, dynamic> json) {
    return MessageChat(message: json['message'], name: json['name']);
  }

  Map<String, dynamic> toJson() => {
    'message' : message,
    'name' : name
  };
}

class ConversationMetaData {
  String convoId;
  String topic;
  List<String>? participants;

  ConversationMetaData(this.convoId, this.topic, this.participants);

  factory ConversationMetaData.fromJson(Map<String, dynamic> json) {
    return ConversationMetaData(
      json['convoId'] as String,
      json['topic'] as String,
      json['participants'] as List<String>?
    );
  }
}
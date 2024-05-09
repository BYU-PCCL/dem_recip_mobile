
String getPartnerType(List<String>? participants) {
  print(participants);
  if (participants == null || participants.isEmpty){
    return 'waiting';
  }
  List<String> parts = participants[1].split('-');
  return parts.length > 1 && parts[1] == 'bot' ? 'bot' : participants[1];
}

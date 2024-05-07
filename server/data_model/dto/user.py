from typing import List, Optional

class User:
    def __init__(
        self,
        gender: Optional[str] = None,
        race: Optional[str] = None,
        partisanship: Optional[str] = None,
        yearBorn: Optional[str] = None,
        conversations: Optional[List[str]] = None,
        isBot: Optional[bool] = None,
        interceptId: Optional[str] = None
    ):
        self.gender = gender
        self.race = race
        self.partisanship = partisanship
        self.yearBorn = yearBorn
        self.conversations = conversations
        self.isBot = isBot
        self.interceptId = interceptId

    def to_dict(self):
        return {
            "gender": self.gender,
            "race": self.race,
            "partisanship": self.partisanship,
            "yearBorn": self.yearBorn,
            "conversations": self.conversations,
            "isBot": self.isBot,
            "interceptId": self.interceptId
        }

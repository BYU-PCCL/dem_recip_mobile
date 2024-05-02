from dataclasses import dataclass

@dataclass
class User:
    username: str
    firstName: str
    lastName: str

    def __init__(self, **entries):
        self.__dict__.update(**entries)
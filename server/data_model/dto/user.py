from typing import Any


class User:
    def __init__(self, entries):
        self.__dict__.update(**entries)

    def get(self, name: str, default=None):
        if name not in self.__dict__:
            return default
        return self.__dict__.get(name)
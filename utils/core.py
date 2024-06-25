#!/usr/bin/python3
"""Utilities functions"""


def kwargs_to_dict(kwargs: list) -> dict:
    """convert keyword args to dict
        Args:
            kwargs: list of kyword args
            e.g. [name="test", age=23, height=23.4]
        Return: equivalent dictionary
    """
    newDict = {}
    for kwarg in kwargs:
        k, v = kwarg.split("=")

        # check for the value datatype
        if v.startswith('"') and v.endswith('"'):
            v = str(v[1:-1]).replace("_", " ")
        elif "." in v:
            v = float(v)
        elif v.isdigit():
            v = int(v)
        else:
            v = None

        if v is None:
            continue

        newDict[k] = v

    return newDict

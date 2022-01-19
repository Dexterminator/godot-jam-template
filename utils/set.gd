class_name Set

var _dict

func _init():
    _dict = {}

func add(x):
    _dict[x] = x

func add_all(coll):
    for x in coll:
        _dict[x] = x

func has(x):
    return x in _dict

func size():
    return len(_dict)
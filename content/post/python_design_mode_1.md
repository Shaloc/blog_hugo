---
title: "Python设计模式#1 单例模式"
date: 2019-05-29T21:55:59+08:00
tags: ["python", "coding", "notes"]
categories: ["python"]
author: "Shaloc"
draft: false
---
## 单例模式(Single Instance)

单例模式，即只允许存在一个实例，当初始化实例时，如果实例已经存在，则获取这个实例，如果不存在，则创建它。

实现一个单例模式也只需依照这一原则，在实例内设置一个标志，创建新实例时，检查实例是否存在，然后决定创建一个新实例并返回还是返回已经存在的实例。

## Python实现示例

```python
# single_object.py
class SingleObject(object):
    """SingleObject: the impl for single object"""

    class _object():
        """The impl for object which will be kept as single object."""

        def __init__(self):
            self.val = None

        def __str__(self):
            return "{0!r} {1}".format(self, self.val)

        # detailed functions

    instance = None

    def __new__(cls):
        if not SingleObject.instance:
            SingleObject.instance = SingleObject._object
        return SingleObject.instance

    def __getattr__(self, name):
        return getattr(self.instance, name)

    def __setattr__(self, name):
        return setattr(self.instance, name)


```

通过这种方法可以简单地保持`_object`有且只有一个，使用单例模式可以保持这个实例到的全局状态，这种模式适用于全局状态不会被运行中的其他模块修改，例如缓存、均衡、路由映射、日志记录等情况。

使用单例模式可以避免项目中的一个部分干扰另一个部分。

## 测试

可以使用下列代码证实它是一个单例程序：

```python
from note1 import SingleObject
obj1 = SingleObject()
obj1.val = " obj1 val "

print(obj1, id(obj1), obj1.val)

obj2 = SingleObject()
obj2.val = " obj2 val "

print(obj2, id(obj2), obj2.val)
print(obj1, id(obj1), obj1.val)
```

如果运行正确，可以得到这样的输出：

```bash
python note1.py 
<class '__main__.SingleObject._object'> 2627147239880  obj1 val
<class '__main__.SingleObject._object'> 2627147239880  obj2 val
<class '__main__.SingleObject._object'> 2627147239880  obj2 val
```

可以看出obj1和obj2获得了相同的id，即同一个`_object`。

使用C++也可以进行类似的实现。
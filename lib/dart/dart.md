[toc]
## Map
```
  var map = Map<String, int>();
  map['foo']=1;
  map['bar']=2;
```

## dynamic 和 Object
所有这些对象的父类就是 Object,Object 和 dynamic 都使得我们可以接收任意类型的参数,dynamic不用做类型检测

# 类
## 构造函数
如果不写构造函数，有一个无参构造函数
```
class Point {
  num x, y;

  Point(num x, num y) {
    // There's a better way to do this, stay tuned.
    this.x = x;
    this.y = y;
  }
}

// 可简写为
class Point {
  num x, y;

  // Syntactic sugar for setting x and y
  // before the constructor body runs.
  Point(this.x, this.y);
}
```
### 命名构造函数
```
class Point {
  num x, y;

  Point(this.x, this.y);

  // Named constructor
  Point.origin() {
    x = 0;
    y = 0;
  }
}
```

### 子类必须调用父类非默认构造函数
```
class Person {
  String firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}
```



## 函数
### 可选参数
```
void main() {
  print(foo(2));//2
  print(foo(1, 2));//3
}
//Dart 也支持可选参数
int foo(int x, [int y]) {
  // 是的，int 也可以是 null
  if (y != null) {
    return x + y;
  }
  return x;
}
```

### 具名参数
```
void main() {
  print(foo(x: 1, y: 2));
  //  具名参数的顺序可以是任意的
  print(foo(y: 3, x: 4));
  //  所有的具名参数都是可选的，这个调用是合法的，但它会导致  foo()  在运行时抛异常
  print(foo());
}

int foo({int x, int y}) {
  return x + y;
}
```

### @required
使用@required表明是必传的参数

### Tips
- 参数可设置默认值
- 函数可作为参数
- 所有的函数都有返回值，如果没有return那么就是return null


### 简写
- 返回值类型、参数类型可省略
```
bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
```
可简写为：
```
isNoble(atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
```

- 当函数只有一条表达式时
```
bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
```


## 异常
抛出异常：
```
throw Exception('put your error message here');
```
捕获异常类似Java,try...catch

## 类
```
class Point2D{
  static const some=2;
  int x;
  int y;
  //构造方法
  Point2D(this.x, this.y);

  //也可以使用这种方式初始化
  Point2D(int x, int y):x=x,y=y{
    //
  }
}
```

## 权限控制
在Dart中没有public、private这些修饰符，默认都是public的，如果以下划线开头表示对包的外部不可见

## Dart的继承
```
class Point2D {
  int x;
  int y;
  Point2D(this.x, this.y);
}

class Point3D extends Point2D {
  int z;

  // 父类的构造函数只能在 initializer list 里调用
  Point3D(int x, int y, int z)
      : z = z,
        super(x, y) {}
}
```
但是对象构造时它跟 Java、C++ 都不太一样：

- 先执行子类 initializer list，但只初始化自己的成员变量
- 初始化父类的成员变量
- 执行父类构造函数的函数体
- 执行之类构造函数的函数体

## 接口
Dart中的所有类都是接口

## 泛型
Dart 的泛型参数类型在运行时是保留的。
```
class Pair<S, T> {
  S first;
  T second;
  Pair(this.first, this.second);
}
```

## 异步
```
void bar() {
  var file = File('path-to-your-file');
  file
      .exists()
      .then(
          (exists) => print('bar:  file  ${exists ? 'exists' : 'not  exists'}'))
      .catchError((e) => print(e));
  print('bar:  after  file.exists()  returned');
}

void foo() async {
  var file = File('path-to-your-file');
  try {
    var exists = await file.exists();
    print('bar:  file  ${exists ? 'exists' : 'not  exists'}');
    print('bar:  after  file.exists()  returned');
  } catch (e) {
    print(e);
  }
}
```


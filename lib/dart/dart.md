[toc]

# 变量
变量的默认值都是null
```
int lineCount;
assert(lineCount == null);
```
## final
final声明的变量只能被赋值一次
```
final name = 'Bob'; // Without a type annotation
final String nickname = 'Bobby';
```

## const
const比final更严格，是编译时常量，在编译的时候就知道它的值，也是final的。
const不能修饰实例化的对象，比如这样是错误的`const p=Point();`，因为不运行是不知道Point()的值的

```
	//编译期常量
	public static final int num = 10;
	//运行时常量
	public static final int len = "Rhien".length();
```

- 用于创建常量
```
var foo = const [];
final bar = const [];
const baz = []; // Equivalent to `const []`
```

- 修饰构造函数
一个类能够定义 const 构造函数的前提是成员变量必须都是用final或const修饰的
```
class Point{
    final String a;
    const Point(String a):this.a=a
}
```

- const 不可变性可传递
如果你有一个final修饰的成员变量，这个成员变量包含了一个集合，那么这个集合仍然是可变的。如果包含的是const修饰的集合，那么集合内的所有东西是递归地不可变的。
下面的代码会报错：
```
  var ab = const [1];
  ab[0] = 2;
```



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


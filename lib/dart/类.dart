//class Point2D {
//  static const some = 2;
//  int x;
//  int y;
//
//  //也可以使用这种方式初始化
//  Point2D(int x, int y)
//      :x=x,
//        y=y {
//    //
//  }
//
//}

//继承
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

//泛型
class Pair<S, T> {
  S first;
  T second;

  Pair(this.first, this.second);
}

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

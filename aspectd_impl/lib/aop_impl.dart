import 'package:aspectd/aspectd.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

@Aspect()
@pragma("vm:entry-point")
class ExecuteDemo {
  @pragma("vm:entry-point")
  ExecuteDemo();

  // @Execute("package:example/main.dart", "_MyHomePageState", "-_incrementCounter")
  // @pragma("vm:entry-point")
  void _incrementCounter(PointCut pointcut) {
    pointcut.proceed();
    print('我只是一个被插的桩桩b');
  }

  // @Execute("package:example/main.dart", "_MyHomePageState", "-_testTypeMethod")
  // @pragma("vm:entry-point")
  T _testTypeMethod<T>(PointCut pointcut) {
    print('插桩到泛型');
    return pointcut.proceed();
  }

  // @Call("package:example/main.dart", "_MyHomePageState", "-_normalMethod")
  // @pragma("vm:entry-point")
  void testNormal(PointCut pointcut) {
    print('插桩到Normal');
    pointcut.proceed();
  }

  // @Execute("package:example/main.dart", "Test", "-printTest")
  // @pragma("vm:entry-point")
  void _test(PointCut pointcut) {
    print('插桩到抽象函数');
    pointcut.proceed();
  }

  @Call('package:flutter/src/gestures/recognizer.dart', 'GestureRecognizer', '-invokeCallback')
  @pragma('vm:entry-point')
  dynamic hookInvokeCallback(PointCut pointCut) {
    print('点我就插');

    return pointCut.proceed();
  }

  @Call('package:flutter/src/rendering/object.dart', 'PrimaryPointerGestureRecognizer', '-handleEvent')
  @pragma('vm:entry-point')
  void hookHandleEvent(PointCut pointCut) {
    print('hittest ');
    dynamic target = pointCut.target;

    PointerEvent pointerEvent = pointCut.positionalParams[0];
    HitTestEntry entry = pointCut.positionalParams[1];

    // _curPointerCode = pointerEvent.pointer;

    if (target is RenderObject) {
      //   if (_curPointerCode > _prePointerCode) {
      //     _clickRenderMap.clear();
      //   }
      //   print('_clickRenderMap is : $_clickRenderMap');
      //   if (!_clickRenderMap.containsKey(_curPointerCode)) {
      //     _clickRenderMap[_curPointerCode] = target;
      //   }
      // }
      // _prePointerCode = _curPointerCode;
      target.handleEvent(pointerEvent, entry);
    }
  }
}

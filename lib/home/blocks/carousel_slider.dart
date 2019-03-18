import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

/// 将给定的输入值（`input`）与给定的页面组件列表的长度（`source`）整除取余，返回当前页面组件列表的索引。
int _remainder(int input, int source) {
  // 最终、整型变量，结果。
  // 算术运算符`%`，取余，除法剩下的余数。
  final int result = input % source;
  // 条件表达式`condition?expr1:expr2`，如果条件为真，返回expr1，否则返回expr2。
  return result < 0 ? source + result : result;
}

/// 给定当前页面视图的索引（`position`）、倒序切换页面数量（`base`）和组件列表的长度（`length`），返回当前页面组件列表的索引。
int _getRealIndex(int position, int base, int length) {
  // 最终、整型变量，补偿。
  final int offset = position - base;
  return _remainder(offset, length);
}

/// 自定义的旋转木马滑块组件。
class CarouselSlider extends StatefulWidget {
  // 最终、组件列表变量，项目列表。
  /// 页面组件列表。
  final List<Widget> items;
  // 最终、数字变量，视窗分数。
  /// 当前页面在视窗中占用的空间，默认为`0.8`。
  final num viewportFraction;
  // 最终、数字变量，初始页面。
  /// 初始化时在视窗中的页面，默认为`0`。
  final num initialPage;
  // 最终、双精度型变量，宽高比。
  /// 宽高比例，默认为`16/9`。
  final double aspectRatio;
  // 最终、双精度型变量，高度。
  /// 页面组件的高度。
  final double height;
  // 页面控制器（`PageController`）类，页面视图（`PageView`）组件的控制器。
  // 页面控制器允许您操纵在页面视图组件中可见的页面。除了能够控制页面视图内部内容的像素偏移之外，
  // 页面控制器还允许您控制页面的偏移量，这是视窗大小的增量。
  // 最终、页面控制器变量，页面控制器。
  /// 页面视图组件的控制器。
  final PageController pageController;
  // 最终、数字变量，真实页面。
  /// 倒序可以切换的页面数量，默认为`10000`。
  final num realPage;
  // 最终、布尔变量，自动播放。
  /// 是否自动播放，默认为`false`。
  final bool autoPlay;
  // 持续时间参数，给一个持续时间（`Duration`）对象。
  // 持续时间（`Duration`）类，指一段时间，例如27天、4小时、12分钟和3秒。
  // 持续时间表示从一个时间点到另一个时间点的差异。
  // 最终、持续时间变量，自动播放持续时间。
  /// 自动播放时的持续时间，默认为`800毫秒`。
  final Duration autoPlayDuration;
  // 曲线（`Curves`）类，常见动画曲线的集合。
  // https://docs.flutter.io/flutter/animation/Curves-class.html
  // 最终、曲线变量，自动播放曲线。
  /// 自动播放时的曲线，默认为`Curves.fastOutSlowIn`。
  final Curve autoPlayCurve;
  // 最终、持续时间变量，间隔。
  /// 切换动画持续时间，默认为`4秒`。
  final Duration interval;
  // 最终、布尔变量，逆转。
  /// 是否逆转页面的切换方向，默认为`false`。
  final bool reverse;
  // 最终、函数变量，更新回调。
  /// 视窗中页面更新时的回调函数。
  final Function updateCallback;
  // 最终、布尔变量，失真。
  /// 切换时当前页面逐渐变小，新页面逐渐变大直至完全替代当前页面，默认为`true`。
  final bool distortion;

  CarouselSlider({
    @required this.items,
    this.viewportFraction: 0.8,
    this.initialPage: 0,
    this.aspectRatio: 16 / 9,
    this.height,
    this.realPage: 10000,
    this.autoPlay: false,
    this.interval: const Duration(seconds: 4),
    this.reverse: false,
    this.autoPlayCurve: Curves.fastOutSlowIn,
    this.autoPlayDuration: const Duration(milliseconds: 800),
    this.updateCallback,
    this.distortion: true,
  }) : pageController = new PageController(
          // 视窗分数属性，每个页面应占用的视窗部分。默认为1.0，这意味着每个页面在滚动方向上填充视窗。
          viewportFraction: viewportFraction,
          // 初始页面属性，首次创建页面视图（`PageView`）组件时显示的页面。
          initialPage: realPage + initialPage,
        );

  // 创造状态方法，在树中的给定位置为此组件创建可变状态。
  // 子类应该重写此方法以返回其关联的状态（`State`）子类的新创建的实例。
  // 框架可以在有状态组件（`StatefulWidget`）的生命周期内多次调用此方法。
  // 例如，如果组件插入到多个位置的树中，则框架将为每个位置创建单独的状态（`State`）对象。
  // 类似地，如果从树中删除组件并稍后再次插入树中，
  // 框架将再次调用创造状态（`createState`）以创建新的状态（`State`）对象，
  // 从而简化状态（`State`）对象的生命周期。
  @override
  _CarouselSliderState createState() => _CarouselSliderState();
  // 或者可以写成下面的样子。
  // _CarouselSliderState createState() {
  //   return new _CarouselSliderState();
  // }

  // 未来（`Future`）抽象类表示延迟计算的对象。
  /// 在给定的持续时间（`duration`）内使用给定的曲线（`curve`）动画到下一页。
  Future<Null> nextPage({Duration duration, Curve curve}) {
    // 页面控制器（`PageController`）类的下一页（`nextPage`）方法，将受控的页面视图动画到下一页。
    // 动画持续给定的持续时间并遵循给定的曲线。动画完成后，返回的未来（`Future`）将解析。
    return pageController.nextPage(
      // 持续时间参数，给一个持续时间（`Duration`）类。
      duration: duration,
      // 曲线参数，曲线（`Curves`）类。
      curve: curve,
    );
  }

  /// 在给定的持续时间（`duration`）内使用给定的曲线（`curve`）动画到上一页。
  Future<Null> previousPage({Duration duration, Curve curve}) {
    // 页面控制器（`PageController`）类的上一页（`previousPage`）方法，将受控的页面视图动画到上一页。
    return pageController.previousPage(duration: duration, curve: curve);
  }

  /// 不进行动画直接跳转到给定的页面（`page`）索引。
  jumpToPage(int page) {
    // 页面控制器（`PageController`）类的页面（`page`）属性，当前显示在受控的页面视图组件中的页面。
    // 双精度型变量的到整型（`toInt`）方法，将此数字截断为整数并将结果作为整型返回。
    // 列表的长度（`length`）属性，返回此列表中的对象数。
    final index =
        _getRealIndex(pageController.page.toInt(), realPage, items.length);
    // 页面控制器（`PageController`）类的跳到页面（`jumpToPage`）方法，
    // 更改哪个页面显示在受控的页面视图（`PageView`）组件中。
    // 将页面位置从其当前值跳转到给定值，不进行动画，也不检查新值是否在范围内。
    return pageController
        .jumpToPage(pageController.page.toInt() + page - index);
  }

  /// 在给定的持续时间（`duration`）内使用给定的曲线（`curve`）动画到给定的页面（`page`）索引。
  animateToPage(int page, {Duration duration, Curve curve}) {
    final index =
        _getRealIndex(pageController.page.toInt(), realPage, items.length);
    // 页面控制器（`PageController`）类的动画到页面（`animateToPage`）方法，
    // 将受控制的页面视图（`PageView`）组件从当前页面动画到给定页面。
    return pageController.animateToPage(
        // 页面参数，给定页面的索引。
        pageController.page.toInt() + page - index,
        duration: duration,
        curve: curve);
  }
}

/// 与旋转木马滑块组件关联的��态子类。
class _CarouselSliderState extends State<CarouselSlider>
    with TickerProviderStateMixin {
  // 整型变量，当前页面。
  /// 当前页面的索引。
  int currentPage;
  // 计时器（`Timer`）变量，计时器。
  // 计时器（`Timer`）抽象类，可配置为一次或多次触发。
  // 计时器从指定的持续时间向下计数到`0`，当计时器达到`0`时，计时器调用指定的回调函数。
  // 使用周期性计时器重复计时相同的间隔。
  /// 自动播放时的计时器。
  Timer timer;

  // 初始状态(`initState`)方法，将此对象插入树中时调用。
  // 框架将为它创建的每个状态（`State`）对象调用此方法一次。
  // 重写此方法以执行初始化，该初始化取决于将此对象插入树中的位置（即上下文）或用于配置此对象的组件。
  @override
  void initState() {
    // 如果重写此方法，请确保您的方法以调用`super.initState()`开头。
    super.initState();
    currentPage = widget.initialPage;
    if (widget.autoPlay) {
      // 计时器.周期（`Timer.periodic`）构造函数，创建一个新的重复计时器。
      // 以持续时间间隔重复调用回调，直到使用取消（`cancel`）方法取消。
      timer = new Timer.periodic(
        // 持续时间参数，给一个持续时间（`Duration`）类。
        widget.interval,
        // 回调函数参数，给一个计时器（`Timer`）抽象类。
        (_) {
          widget.pageController.nextPage(
              duration: widget.autoPlayDuration, curve: widget.autoPlayCurve);
        },
      );
    }
  }

  // 组件（`Widget`）类，描述组件元素的配置。组件是Flutter框架中的中心类层次结构。
  // 组件是用户界面的一部分的不可变描述。组件可以膨胀成元素，这些元素管理底层渲染树。
  /// 如果有指定高度（`height`），则使用容器组件包装子组件（`child`），否则使用宽高比组件包装，返回包装后的新组件。
  getWrapper(Widget child) {
    // 作为当前构建上下文元素的当前配置。widget.height是当前组件的高度变量。
    if (widget.height != null) {
      // 容器组件，结合了常见的绘图、定位和大小调整的容器。
      // 该组件首先用填充（`padding`）围绕子组件（由装饰（`decoration`）中存在的任何边界膨胀），
      // 然后对填充范围应用附加约束（`constraints`）。
      // 如果非空的话，将宽度（`width`）和高度（`height`）合并为约束。
      // 然后容器被边缘（`margin`）描述的额外空白的空间包围。
      return Container(
        // 如果容器组件没有子组件，没有高度，没有宽度，没有约束，
        // 并且父节点提供无限制约束，Container会尝试尽可能小。
        height: widget.height,
        child: child,
      );
    } else {
      // 宽高比组件，将子组件调整为特定宽高比。该组件首先尝试布局约束允许的最大宽度。
      // 组件的高度通过将给定的宽高比应用于宽度来确定，表示为宽度与高度的比率。
      return AspectRatio(
          // 宽高比属性，尝试使用的宽高比。
          // 纵横比表示为宽高比。例如`16:9`的`宽度:高度`纵横比的值为`16.0/9.0`。
          aspectRatio: widget.aspectRatio,
          child: child);
    }
  }

  // 处理(`dispose`)方法，永久地从树中删除此对象时调用。
  // 当此状态(`State`)对象永远不会再次构建时，框架将调用此方法。
  // 状态(`State`)对象的安装(`mounted`)属性，此状态(`State`)对象对象当前是否在树中。
  // 在框架调用处理(`dispose`)方法之后，状态(`State`)对象被认为是已卸载且安装(`mounted`)属性为`false`。
  // 此时调用设置状态（`setState`）方法是错误的。
  // 生命周期的这个阶段是终点：没有办法重新安装已经处置的状态(`State`)对象。
  @override
  void dispose() {
    // 如果覆盖它，请确保通过调用`super.dispose`来结束方法。
    super.dispose();
    // 计时器（`Timer`）抽象类的取消（`cancel`）方法，取消计时器。
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return getWrapper(
        // 页面视图组件，可逐页工作的可滚动列表。页面视图组件中的每个子组件都被强制与视窗大小相同。
        // PageView.builder构造函数，创建可滚动列表，使用按需创建的组件逐页工作。
        // 此构造函数适用于具有大量或无限子组件数的页面视图，因为只会为实际可见的子组件调用构建器。
        PageView.builder(
      // 在页面上更改属性，每当视窗中心的页面发生更改时调用。
      onPageChanged: (int index) {
        currentPage =
            _getRealIndex(index, widget.realPage, widget.items.length);
        if (widget.updateCallback != null) widget.updateCallback(currentPage);
      },
      // 控制器属性，给定一个页面控制器对象，可用于控制滚动此页面视图的位置。
      controller: widget.pageController,
      // 逆转属性，页面视图是否在阅读方向上滚动。
      // 例如，如果读取方向是从左到右，滚动方向(`scrollDirection`)属性是轴.横（Axis.horizontal），
      // 则页面视图在逆转属性为`false`时从左向右滚动，而在逆转属性为`true`时从右向左滚动。
      reverse: widget.reverse,
      // 项目构建器属性，给定一个构建方法。
      itemBuilder: (BuildContext context, int i) {
        // 最终、整型变量，索引。
        final int index =
            _getRealIndex(i, widget.realPage, widget.items.length);
        // 动画构建器组件，用于构建动画的通用组件。
        // 动画构建器组件对于希望将动画作为更大构建函数的一部分包含在内的更复杂的组件非常有用。
        // 要使用动画构建器组件，只需构造组件并将其传递给构建器函数。
        return AnimatedBuilder(
            // 动画属性，给一个控制器对象。
            animation: widget.pageController,
            // 构建器属性，每次动画改变值时调用。
            builder: (BuildContext context, child) {
              // 在第一次渲染时，页面控制器（`PageController`）类的页面（`page`）属性为`null`，这是一个脏数据。
              // 页面控制器（`PageController`）类的位置（`position`）属性，返回附加的滚动位置（`ScrollPosition`）抽象类，
              // 可以从中获取滚动视图（`ScrollView`）抽象类的实际滚动偏移量。
              if (widget.pageController.position.minScrollExtent == null ||
                  widget.pageController.position.maxScrollExtent == null) {
                // 未来.延迟（`Future.delayed`）构造函数，创建一个在延迟后运行其计算的未来。
                // 计算将在给定的持续时间过去之后执行，并且将使用计算结果完成未来。
                // 如果计算返回未来，则此构造函数返回的未来将使用该未来的值或错误。
                Future.delayed(
                  // 持续时间参数，给一个持续时间（`Duration`）类。
                  Duration(microseconds: 1),
                  // 计算参数，给一个未来或（`FutureOr<T>`）抽象类。
                  () {
                    // 设置状态（`setState`）方法，通知框架该对象的内部状态已更改。
                    // 每当您更改状态对象的内部状态时，请在传递给设置状态的方法中进行更改。
                    setState(() {});
                  },
                );
                return Container();
              }
              // 双精度型变量，值。
              double value = widget.pageController.page - i;
              // 双精度型变量的绝对值（`abs`）方法，返回表示此双精度型变量的绝对值的新双精度型变量。
              // 双精度型变量的区间（`clamp`）方法，将随机变化的数值限制在一个给定的区间lowerLimit-upperLimit内。
              value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
              // 最终、双精度型变量，高度。
              // 运算符`??`，表示如果为空。
              // 媒体查询（`MediaQuery`）组件，建立媒体查询解析给定数据的子树。
              // 媒体查询.关于（`MediaQuery.of`）静态方法，来自此类的最近实例的数据，它包含给定的上下文。
              // 媒体查询数据（`MediaQueryData`）类，关于媒体（例如，窗口）的信息。
              // 例如，要了解当前媒体的大小（例如，包含您的应用程序的窗口），
              // 您可以从`MediaQuery.of`返回的`MediaQueryData`中读取`MediaQueryData.size`属性：
              // `MediaQuery.of(context).size`
              final double height = widget.height ??
                  MediaQuery.of(context).size.width * (1 / widget.aspectRatio);
              // 最终、双精度型变量，失真值。
              // 曲线（`Curves`）类的放松（`easeOut`）常量，返回一个立方体（`Cubic`）动画曲线，快速启动并缓慢结束。
              // 立方体（`Cubic`）类，单位区间的三次多项式映射。
              // 立方体（`Cubic`）类的转变（`transform`）方法，返回t点处曲线的值。
              // https://docs.flutter.io/flutter/animation/Cubic-class.html
              final double distortionValue =
                  widget.distortion ? Curves.easeOut.transform(value) : 1.0;
              // 中心（`Center`）组件，它将子组件置于其中心。
              return Center(
                  // 大小框组件，如果设置子（`child`）属性的值，这个组件会强制其子组件具有特定的宽度或高度（假设此组件的父级允许）。
                  // 如果宽度或高度为空值，则此组件将自行调整大小以匹配该维度中子组件的大小。
                  // 如果没有设置子（`child`）属性的值，这个组件将自己调整到给定的宽度和高度，将空值视为零。
                  child: SizedBox(
                // 高度属性，如果非空值，则要求子组件具有这个高度。
                height: distortionValue * height,
                child: child,
              ));
            },
            // 子属性，要传递给构建器的子组件。
            // 如果构建器回调的返回值包含不依赖于动画的子树，则构建该子树一次而不是在每个动画刻度上重构它都会更有效。
            // 如果将预构建的子树作为子参数传递，动画构建器组件会将其传递回构建器函数，以便将其合并到构建中。
            child: widget.items[index]);
      },
    ));
  }
}

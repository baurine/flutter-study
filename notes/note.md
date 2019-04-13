# Flutter Notes

## Note 1

- [Flutter 中文网](https://flutterchina.club/)

### 安装

安装，配置环境，略。

下载 SDK 安装包，在 Mac 上解压即可，再配置 PATH 路径。

检查是否配置安装齐全：`$ flutter doctor`

升级 flutter: `$ flutter upgrade`

创建 flutter 工程：`$ flutter create my_app`

进入工程目录，启动 app: `$ flutter run`

### 编写第一个 Flutter 应用

原理和 React / React Native 差不多，但由于 React 有 JSX 语法的支持，写起来比 Flutter 简洁很多。

另外，Flutter 并没有要求 state 必须是 immutable 的，可以修改原来的 state。如下所示：

    onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },

`setState()` 显式地触发重新渲染。

另外，暂时没有理解此例中，修改了 `_suggestions` 后，并没有显式地调用 `setState()`，为什么会触发重新渲染。如下所示：

    if (index >= _suggestions.length) {
      // ... 接着再生成 10 个单词对，然后添加到建议列表
      _suggestions.addAll(generateWordPairs().take(10));
    }

另外，为什么需要两个拆开的 RandomWords 和 RandomWordsState 组件，为什么不合并在一起呢？需要进一步学习才能理解。

Flutter 和 React 还有一点很大的不同，Flutter 并没有使用 Android / iOS 的原生组件，而是自己完全重新实现了一套渲染系统，而 React 在底层还是使用了系统的原生组件的。

跟随教程最终的实现：

![](../art/startup_name_generator.gif)

### Widget 框架总览

Flutter 的核心是 Widget，或是无状态的 StatelessWidget，或是有状态的 StatefulWidget，主要工作是实现 `build` 函数。

基础 Widget：Text, Row / Column, Stack, Container ...

#### 使用 Material 组件

Flutter 提供了许多开箱即用的 widgets，如果想用 Material 风格，则必须从 MaterialApp widget 开始，该 widget 提供了管理路由的 Navigator。

#### 处理手势

使用 GestureDector widget。

略。简单了解。

#### 根据用户输入改变 Widget

StatefulWidget, State

在这一小节，解释了为什么要拆成 StatefulWidget 和 State 两个单独的对象，而不是合并在一起，像 React 那样。

> 在 Flutter 中，这两种类型的对象具有不同的生命周期： Widget 是临时对象，用于构建当前状态下的应用程序，而 State 对象在多次调用 `build()` 之间保持不变，允许它们记住信息 (状态)。

还不是很理解。

演示了计数器的例子。

#### 整合所有

略。

#### 响应 widget 的生命周期事件

initState / dispose ... 就这两个，这也太粗糙了吧...

在 initState 中可以进行网络请求获取数据。

#### Key

目测和 React 中 key 的作用是一样的。

### Widget 目录

略。

### Cookbook

显示来自网上的图片：

    new Image.network(
      'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
    )

基本 List：使用 ListView，ListView 中的列表项，可以用 ListTile widget。

从互联网上获取数据：

官方 http 库，但功能比较简单，推荐使用 dio 库。

获取并显示数据，使用 FutureBuilder。

### 示例目录

略。

### 构建布局

简单看了一下，感觉 Flutter 是把简单事情复杂化了吧，什么都是 Widget ... 把简单的布局搞复杂了。感觉不会流行起来的。

算了，剩下的不看了，等它有机会流行起来再看吧。

Update: 2019/4/5

再次复习 Flutter，还是觉得布局很容易嵌套得很深，每个 widget 的用法也不统一，要记的太多了，只能边用边看文档了。

dart2 生成实例对象时不再需要 new 关键字。

## Note 2

通过一个示例练习：

- 使用 dio 进行网络请求
- 解析 json
- 将 json 中的内容显示在 listview 中

demo:

![](../art/dio_json.gif)

参考：

- [dio 官方文档](https://github.com/flutterchina/dio/blob/master/README-ZH.md)
- [Flutter dio 结合 json_serializable 请求数据并解析 Demo](https://www.jianshu.com/p/e010041f0ec0)
- [Mocky](https://www.mocky.io/)
- [json2dart - 为了便利使用 json_serializable 库](https://caijinglong.github.io/json2dart/index_ch.html)

上面的 demo 就来自第二个参考。

### 使用 dio 进行网络请求

看官方文档即可。如果没有合适的 API 可以使用，可以使用 [Mocky](https://www.mocky.io/) 这个服务 mock 一个 API，很是方便。

### 解析 JSON

主要使用到 json_serializable 和 json2dart 这两个工具。手工解析 json 很麻烦，这两个工具可以帮我们生成解析 json 的代码，相当于代码生成器，cool! 要一起使用的库还有 json_annotation 和 build_runner。

由 user.dart 生成 user.g.dart 的命令：

    $ flutter packages pub run build_runner build

后续学习：

- 路由
- 状态管理 (redux?)

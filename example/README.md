# toastx_example
toastx 使用示例.

# toastx

A Toast Plus of Flutter.

# 安装

1. 在 pubspec.yaml 中添加

```
dependencies:
  toastx: ^0.0.1
```

2. 执行命令

```
  flutter packages get
```

3. 导入

```
import 'package:toastx/toastx.dart';
```

# 使用

```
# 顶部显示
Toastx.show(context, '顶部', location: ToastxLocation.TOP);

# 中部显示
Toastx.show(context, '中部', location: ToastxLocation.CENTER);

# 短时间显示
Toastx.show(context, '底部2s', duration: ToastxDuration.SHORT);

# 中等时间显示
Toastx.show(context, '底部5s', duration: ToastxDuration.MIDDLE);

# 长时间显示
Toastx.show(context, '底部10s', duration: ToastxDuration.LONG);

# 自定义显示背景
Toastx.show(context, '红色背景', color: Colors.red);

# 自定义显示字体风格
Toastx.show(context, '字体', style: TextStyle(fontSize: 30);
```


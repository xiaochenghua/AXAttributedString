# AXAttributedString
An easier NSAttributedString builder, Use Chain-syntax like ```Masonry```.

*Support for iOS 7.0+, Base on Objective-C.*

### Installation
```
pod 'AXAttributedString'
```

### Manual
1. Download the AXAttributedString repository;
2. Copy the AXAttributedString sub-folder into your Xcode project;
3. Import the head file ```AXAttributedString.h``` to your file.

### Usage
```objective-c
[AXAttributedString makeAttributedString:^(AXAttributedStringMaker *make) {
    make.text(@"第一段").foregroundColor(UIColor.blackColor).font([UIFont systemFontOfSize:14]).underlineStyle(NSUnderlineStyleSingle);
    make.text(@"第二段").font([UIFont systemFontOfSize:14]).foregroundColor(UIColor.blueColor).backgroundColor(UIColor.lightGrayColor);
    make.text(@"第三段").foregroundColor(UIColor.orangeColor).systemFontSize(20).strikethroughStyle(NSUnderlineStyleThick).strikethroughColor(UIColor.redColor);
    make.text(@"\n");   //  line break
    make.text(@"第四段").foregroundColor(UIColor.brownColor).font([UIFont boldSystemFontOfSize:30]).baselineOffset(-15);
    make.text(@"第五段").foregroundColor(UIColorFromRGB(0xCC00FF)).systemFontSize(30);

    //  Not allow formatted(remove the first and last empty) string to be empty
    //  make.text(@"");
}];
```

![Screenshot_iPhoneSE](https://raw.githubusercontent.com/arnoldxiao/AXAttributedString/master/UI_Screenshot_iPhoneSE%402x.png)

### Supported attribute list
* ``` text ```, Requied, Must be the first, **NOT ALLOW** the empty formatted substring.
* ``` foregroundColor ```
* ``` backgroundColor ```
* ``` font ```
* ``` systemFontSize ```
* ``` underlineStyle ```
* ``` underlineColor ```
* ``` baselineOffset ```
* ``` strikethroughStyle ```
* ``` strikethroughColor ```
* ``` paragraphStyle ```
* ``` strokeColor ```
* ``` strokeWidth ```
* ``` attachment ```
* ``` linkUrl ```
* ``` linkString ```
* ``` ligature ```
* ``` kern ```
* ``` shadow ```
* ``` textEffect ```
* ``` obliqueness ```
* ``` expansion ```
* ``` writingDirection ```
* ``` verticalGlyphForm ```

### Contact me
> Email: <arnoldxiao@163.com>
> Wechat: arnold-xiao

Give me a **star** please If its helpful for you, ***Thank you!***


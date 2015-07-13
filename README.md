# JHSwitchScreenDemo
横竖屏切换（仿视频播放）

# 介绍：横竖屏切换

如果要横竖屏都支持的app，我觉得最好就用autolayout来布局界面。不然重置位置很麻烦。

//iOS8旋转动作的具体执行
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator NS_AVAILABLE_IOS(8_0);

//iOS7旋转动作的具体执行
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration

直接把此方法重写在UIViewController，即将旋转时，会回调此方法，在此方法可以做界面处理。
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator: coordinator];
    // 监察者将执行： 1.旋转前的动作  2.旋转后的动作（completion）
    [coordinator animateAlongsideTransition: ^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
       1.旋转前的动作
     } completion: ^(id<UIViewControllerTransitionCoordinatorContext> context) {
         2.旋转后的动作
     }]; 
}

转换屏幕有两种方式：（1）旋转手机；（2）手动触发；
介绍一下第（2）种方式的代码实现：
+ (void)forceOrientation: (UIInterfaceOrientation)orientation {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget: [UIDevice currentDevice]];
        int val = orientation;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

传入的参数是想要切换的方式UIInterfaceOrientation；

基本要切换屏幕的知识讲完了，接下来看实践；
需要注意：
（1）需要横竖屏要支持的，最好用autolayout来布局；
（2）因为视频播放，横屏时是布满屏幕，所以在切换屏幕时，要修改一下约束。

先看一下基本的界面布局：



基本的添加约束就不说了，这里讲一下横屏如何布满屏幕。
（1）headerView有一个高度约束；
（2）headerView和superView的top为0；
（3）contentView和headerView的间距为0；
（4）contentView和superView的bottom为（横屏为0，竖屏自己定）；

约束搞定！
当切换横屏时，只要两步：
（1）把headerView的高度约束值改为0；
（2）把contentView和superView的bottom改为0；

当切换回竖屏时，再设为初始值，搞定！

模仿 视频播放横竖屏切换 搞定，效果如下：



Demo的路径：

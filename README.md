# MSTabBar
- 1、自定义UITabBar，实现类似新浪微博中间的发布按钮
- 2、简单好用，放到项目中，更换UITabBarController的tabBar属性即可
   ```
   /**更换tabBar
     *tabBar为readonly只读属性，通过KVC修改
     *self.tabBar = [[MSTabBar alloc] init];此方法报错
     */
    MSTabBar *tabBar = [[MSTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
   
   ```
- 3、实现中间按钮的点击事件，回调block即可

  ```
  //回调Block
    tabBar.publishBtnClick = ^(){
        //跳转到发布页面
        MSPublishViewController *plus = [[MSPublishViewController alloc]init];
        [self presentViewController:plus animated:YES completion:nil];
    };
  
  ```
  
  
- 4、效果图如下：
  
  ![](https://github.com/LucyLoveApp/MSTabBar/raw/master/displayPic/image1.png)
  
  点击发布按钮，跳转到此页面（下图）：
  
  ![](https://github.com/LucyLoveApp/MSTabBar/raw/master/displayPic/image2.png)
  



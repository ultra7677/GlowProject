# GlowProject
Learning IOS Development

######2015.10.12
经过将近一周假期的探索与学习，勉强完成了project的框架，但是依然有很多细节方面的东西需要进一步学习。
打算先上传到github上面来备份，这样也方便自己记录对这个project的学习路程，因为最近开学又只能用断断续续的零散时间学习，
所以最好还是把每一次做到什么程度记录一下，这样也节约自己继续工作时的回忆时间。

这个阶段的大体情况是用两个UITabelViewController来分别实现主题列表页面与主题详情页面，其中的页面间的数据传输
是用UIStoryboardSegue。
现在我准备优先填界面上留下的坑，所以还有很多layout之类的东西需要学习。

还要做的有:  
* 当前对点击单个主题的跳转是通过在storyboard里面对对应主题的cell的点击跳转，我想最好要实现点击标题的跳转。
但是如果这样做的话，prepareForSegue里面的参数sender会是一个UIButton，当时做这块的时候没有仔细思考这一块的内容。
现在觉得如果通过UIButton里面记录cell的下标还是可以对应到具体的主题。但是由于当前还有更重要的坑要填准备先放一下。  
* ~~图片的显示，留着坑等以后填。~~  
* ~~目前界面太丑，无论是字体还是排版还是颜色，而且没有自动适应的layout。所以当前主要的精力会放在这一块。~~

正在做的:  
学习autolayout，重做界面，完成字体与配色还有按钮图标的一堆设计。  
UITabelViewControllerCell如何自定义单独一个cell的内容等等。  


#####2015.10.13
完成主题列表页面的界面，采用autolayout保证label之间，单个label与其文字的相互协调  
完成用户个人头像的显示，并把方形图片剪裁成圆形（只有正方形的图片才能保证完美的圆形)  
学会了怎么让tabelViewControllerCell每个cell的高度与内容保持一致  
具体到commentLabel上面目前还没开始做让label随着文本内容调节 目测应该加几个constrains就好了  
基本上完成了主体列表页面  
  
还要做的:  
* 主题详情页面的页面设计与显示  
* json文件的读入等  
* 后续再考虑陆续添加发送主题，用户注册登录等内容（主要是平时的课业压力也上来了，然后机器学习方面的东西也一直在拖延,学校里又有很多个project要做估计能撸IOS的时间不多)   
* 当前对点击单个主题的跳转是通过在storyboard里面对对应主题的cell的点击跳转，我想最好要实现点击标题的跳转。
但是如果这样做的话，prepareForSegue里面的参数sender会是一个UIButton，当时做这块的时候没有仔细思考这一块的内容。
现在觉得如果通过UIButton里面记录cell的下标还是可以对应到具体的主题。但是由于当前还有更重要的坑要填准备先放一下。 

#####2015.10.16
实现了让commentViewControllerCell的每个cell高度与不同长度的回复保存一致，这周末有概率论期中考试，会暂停几天进度

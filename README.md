# Online-Shop

> 三秋 RUBY 大作业



## 环境

- Ruby 版本：3.1.2
- Rails 版本：7.0.4
- 数据库：sqlite3 3.36.0



## cookbook3

> 第一个 Rails 作业

**运行：**

```shell
git checkout cookbook3
bundle install
rails db:migrate
rails s -b 0.0.0.0
```



## blog4

> 第二个 Rails 作业

**运行：**

```shell
git checkout blog4
bundle install
rails db:migrate
rails s -b 0.0.0.0
```



## project

> 大作业，选题为在线商城

**运行：**

```shell
git checkout project
bundle install
rails db:migrate
rails s -b 0.0.0.0
```



### 产品定位

小 W 创业需要一个网站来销售他的产品，在这个网站中只有一个卖家，他作为管理员可以在网站中新增、修改或下架商品，他还可以查看所有客户的订单并进行一定的订单管理。没有注册的用户可以使用网站的一些基本功能，如浏览商品列表、查看商品详情等。在此基础上，注册用户可以将商品添加到自己的购物车或收藏夹，可以从购物车的商品中生成订单，可以对生成的订单进行付款、确认收货和取消等操作。

### 需求建模

<img src="https://s1.ax1x.com/2023/01/03/pSimvWV.png" alt="pSimvWV.png" border="0"  width="70%"/>

其中，订单操作的具体逻辑如下：

<img src="https://s1.ax1x.com/2023/01/03/pSimxzT.png" alt="pSimxzT.png" border="0" width="60%"/>

### 数据库表设计

<img src="https://s1.ax1x.com/2023/01/03/pSinSQU.png" alt="pSinSQU.png" border="0" width="70%" />

### 页面设计

共设计 11 个页面：

1. 首页
2. 登录 / 注册页
3. 商品详情页
4. 我的收藏页
5. 我的购物车页
6. 我的订单 / 订单管理页
7. 全部商品 / 商品管理页
8. 搜索商品页
9. 新增商品页
10. 修改商品页
11. 个人中心页



## 参考

**文档：**

- <a href="https://guides.rubyonrails.org/">Ruby On Rail</a>

**教程：**

- <a href="https://ruby-china.github.io/rails-guides/">官网中文版</a>
- <a href="https://wizardforcel.gitbooks.io/rails-tutorial/content/index.html">Ruby on Rails Tutorial 中文版</a>
- <font color="pink">★★★★★</font> <a href="https://clwy.cn/guide/documents/rails">clwy</a>
- <a href="https://www.wenjiangs.com/doc/9zynnhg9">wenjiangs</a>
- <a href="http://rails_book.siwei.me/">siwei</a>
- <a href="https://www.qiuzhi99.com/groups/ruby">qiuzhi</a>
- <font color="pink">★★★</font> <a href="https://pragprog.com/titles/rails7/agile-web-development-with-rails-7/">Agile Web Development with Rails 7</a>

**GitHub 项目：**

- Rails7 https://github.com/davmz/Dibby-Note-Ecommerce-Project
- Rails6 https://github.com/JulianRodriguez29/OnlineShop
- Rails6 https://github.com/gitnyasha/rails-online-store
- Rails5 https://github.com/colinebrlt/online-shop-thp
- Rails5 https://github.com/minhquang4334/OnlineBasketShopping
- Rails5 https://github.com/kiranshahi/Guitar-Shop-Management-System
- Rails5 https://github.com/david-lake/rails-ecommerce

**devise：**

- <a href="https://github.com/heartcombo/devise">GitHub：devise</a>
- <font color="pink">★★★</font> <a href="https://blog.csdn.net/ysc6688/article/details/46391503">CSDN：rails使用devise验证</a>
- <a href="https://blog.csdn.net/cunjie3951/article/details/106922228/">CSDN：Rails 图像上传：使用 CarrierWave 和 Devise</a>
- <a href="https://www.cnblogs.com/roy0524/p/7979391.html">博客园：rails + devise 用户注册登录及权限判断</a>
- <a href="http://qjpcpu.github.io/blog/2014/02/14/railsshi-yong-deviseyan-zheng-yong-hu/">Rails 使用 devise 验证用户</a>
- <a href="https://www.coder.work/article/6438918">ruby-on-rails - 使用 Devise after_sign_in_path_for 进行重定向循环</a>
- <a href="http://lichen-blog.logdown.com/posts/1830286">devise 自定义登录页面</a>

**bootstrap：**

- 安装相关
  - 未安装 <a href="https://github.com/twbs/bootstrap">GitHub：bootstrap</a> 
  - 未安装 <a href="https://github.com/twbs/bootstrap-rubygem">GitHub：bootstrap-rubygem</a> 
  - 未安装 <a href="https://github.com/seyhunak/twitter-bootstrap-rails">GitHub：twitter-bootstrap-rails</a>
  - 已安装 <a href="https://github.com/twbs/bootstrap-sass">GitHub：bootstrap-sass</a> 
  - 已安装 <a href="https://github.com/doabit/bootstrap-sass-extras">GitHub：bootstrap-sass-extras</a> 
  - 为了在 bootstrap-sass 中可以使用 generate <font color="pink">★★★</font> <a href="https://stackoverflow.com/questions/18063651/rails-generate-bootstrap-layout-with-bootstrap-sass-instead-of-twitter-bootstrap">StackOverFlow：rails generate bootstrap layout with bootstrap-sass instead of twitter-bootstrap-rails</a>
  - <a href="https://developer.aliyun.com/article/577308">阿里云：[ruby]Rails中使用bootstrap</a>

- 使用相关
  - <a href="https://getbootstrap.com/docs/5.2/getting-started/introduction">官方教程</a>
  - <a href="https://code.z01.com/bootstrap/docs/index.html">官方教程中文版</a>
  - <a href="https://www.runoob.com/bootstrap/bootstrap-tutorial.html">菜鸟教程：Bootstrap 教程</a>
  - <font color="pink">★★★★★</font> <a href="https://www.runoob.com/try/bootstrap/layoutit/?">Bootstrap 在线设计工具</a>


**其它：**

- 关于表单
  - （没用） <a href="https://qastack.cn/programming/3027149/how-do-i-create-multiple-submit-buttons-for-the-same-form-in-rails">如何在 Rails 中为同一表单创建多个提交按钮？</a>
  - （没用） <a href="https://dev.to/konnorrogers/escaping-the-traditional-rails-form-4c4o">Escaping the traditional Rails form</a>

- 关于 link_to
  - （没用） <a href="https://www.bilibili.com/read/cv16831406/">B 站：Rails7 如何使点击 a 元素时，发起 delete 请求？如何使弹窗确认？</a>
  - （没用） <a href="https://stackoverflow.com/questions/70474422/rails-7-link-to-with-method-delete-still-performs-get-request">StackOverFlow：Rails 7 - link_to with method :delete still performs GET request</a>
  - （没用） <a href="https://stackoverflow.com/questions/73536663/sprocketsdoublelinkerror-multiple-files-with-the-same-output-path-cannot-be">StackOverFlow：Sprockets::DoubleLinkError - Multiple files with the same output path cannot be linked ("application.js")</a>

- 关于模态框
  -  <a href="https://www.itread01.com/article/1503201564.html">Bootstrap 模態框（Modal）帶引數傳值例項</a>
  -  （没用）<a href="https://stackoverflow.com/questions/8729223/how-to-pass-an-object-to-a-reveal-modal-pop-up-window">StackOverFlow：How To Pass An Object To A Reveal Modal Pop-Up Window?</a>
  -  （没用）<a href="https://stackoverflow.com/questions/34890989/ror-pass-params-to-modal">StackOverFlow：ROR pass params to modal</a>

- 关于 JS
  - <a href="https://blog.csdn.net/TimEcho/article/details/117161916">CSDN：Bootstrap 实现动态添加删除输入框组-案例</a>
  - <a href="https://how2j.cn/k/boostrap/boostrap-setup/539.html">引入 bootstrap.min.js 的方法</a>
  - <a href="https://www.xuewangzhan.net/baike/html-43869.html">HTML表单中正则验证邮箱、手机、电话、身份证代码</a>
  - <a href="https://blog.51cto.com/reliableyang/5651659">JavaScript 表单的格式等有效性校验（获取元素、事件）</a>
  - <a href="https://www.cnblogs.com/Renyi-Fan/p/9094803.html">博客园：js 进阶正则表达式 14 验证邮编（input 的 pattern 属性）（正则表达式加起 ^ 始 $）</a>

- 关于加密
  - <a href="https://blog.csdn.net/ppiao1970hank/article/details/6794004">CSDN：ruby 的加密库（md5/sha1/base64）</a>

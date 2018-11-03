1、Maven项目的目录结构：<br>
![](https://github.com/nextyearmuscleman/SSM_detail/raw/master/picture/maven%E6%9E%84%E5%BB%BA%E4%B9%8B%E5%90%8E%E7%9A%84%E9%A1%B9%E7%9B%AE%E7%9B%AE%E5%BD%95.png)
![](https://github.com/nextyearmuscleman/SSM_detail/raw/master/picture/maven%E9%A1%B9%E7%9B%AEbuild%E4%B9%8B%E5%89%8D%E7%9B%AE%E5%BD%95.png)<br>
2、跳转到html页面，因为html没有引入局部页面的功能，解决方法是-->使用jsp的include局部页面；-->使用Thymeleaf引入局部页面<br>
3、前台使用js跳转到html![](https://github.com/nextyearmuscleman/SSM_detail/raw/master/picture/%E8%B7%B3%E8%BD%AC%E5%88%B0html.png)
## 4、Jquery使用的细节
```
1、
$(this).attr(key);　　获取节点属性名为key的值，相当于getAttribute(key)方法
$(this).attr(key,value);　　设置节点属性名为key的值，相当于setAttribute(key,value)方法

Test：
<input class="radio" name="orgType" id="dept">  
var dept = $("#dept").attr("id");　　//获得属性名为id的值：dept；是属性的名称

2、
$(this).val();　　获取某个元素节点的value属性的值，相当于$(this).attr("value")，value即是节点的属性名
$(this).val(value);　　 设置某个元素节点的value属性的值，相当于$(this).attr("value", value)，后面value是要设置的值
```



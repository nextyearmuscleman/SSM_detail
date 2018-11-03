
```
 @Controller  
 @RequestMapping(value="login")  
public class Login {  
  //返回的是ModelAndView：其作用是
        1、设置转向地址 2、传递数据给前台页面
    public ModelAndView login(){  
        ModelAndView mav = new ModelAndView();  
        mav.setViewName("welcome"); //返回的文件名  
          
        mav.addObject("message","hello kitty");  
          
        //List  
        List<String> list = new ArrayList<String>();  
        list.add("java");  
        list.add("c++");  
        list.add("oracle");  
        mav.addObject("bookList", list);  
          
        //Map  
        Map<String,String> map = new HashMap<String,String>();  
        map.put("zhangsan", "北京");  
        map.put("lisi", "上海");  
        map.put("wangwu", "深圳");  
        mav.addObject("map",map);  
         
         //一股脑将之前使用.addObject()方法添加的list、map、msg都放到了ModelAndview中
        return mav;  
    }  
}  

----------------
前台使用jstl表达式遍历打印
    jsp页面引入-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

    jsp页面：     
    <body>  
       <!-- 输出普通字符 -->  
       ${message } <br/>  
       <!-- 输出List -->  
       <p>书籍列表</p>  
       <c:forEach items="${bookList}" var="node">  
            <c:out value="${node}"></c:out>  
       </c:forEach>  
       <br/>  
       <br/>  
         
       <!-- 输出Map -->  
       <c:forEach items="${map}" var="node">  
            姓名：<c:out value="${node.key}"></c:out>  
            住址：<c:out value="${node.value}"></c:out>  
            <br/>  
       </c:forEach>  
    </body>  
 ```
  返回的结果:<br>
 ![](https://github.com/nextyearmuscleman/SSM_detail/raw/master/picture/ModelAndView.PNG)
 ## ModelAndView和ModelMap和model的区别<br>
 1、Model ：Model接口(Model接口的实现类ExtendedModelMap继承了ModelMap)；是每次请求SpringMVC框架自动创建的

------------

 2、ModelMap：不可以设置页面跳转的url地址别名或者物理跳转地址；主要作用是对象主要用于传递控制方法处理数据到结果页面；解决方法：
 ```
 public String xxxxmethod(String someparam,ModelMap model) { 
     //省略方法处理逻辑若干 
     //将数据放置到ModelMap对象model中,第二个参数可以是任何java类型 
     model.addAttribute("key",someparam); ...... 
     //返回跳转地址 return "path:handleok"; 
 }
 ```
 -----
 
 3、ModelAndView的作用：
* 设置转向地址
```
ModelAndView view = new ModelAndView("path:ok");
```
* 传递控制方法处理结果数据到结果页面
```
addObject(String key,Object value);
```
## Model|ModelMap的使用
```
@RequestMapping("admin_category_list") 
    public String list(Model model){ 
    List<Category> cs = categoryService.list(); 
     model.addAttribute("datas", cs); 
     //服务器跳转到"admin/listCategory"视图 
     //“admin/listCategory” 会根据后续的springMVC.xml 配置文件，跳转到 WEB-INF/jsp/admin/listCategory.jsp 文件 
     return "admin/listCategory"; 
 }
 ```
 前台输出Model中的数据
 ```
 <c:foreach items="${datas}" var="var">
    <tr>
       <td>${var.id}</td>
       <td>${var.name}</td>
    </tr>
 </c>
 ```



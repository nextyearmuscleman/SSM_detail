
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
 返回的结果:
 ![](https://github.com/nextyearmuscleman/SSM_detail/raw/master/picture/ModelAndView.PNG)
 

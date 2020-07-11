# SSM框架整合
1. sql文件在sql文件夹下.
2. 使用tomcat启动项目，在VM options中配置``-Dfile.encoding=UTF8``
3. 在resources中的jdbc.properties中配置数据库，其他基本不用动

## 前端
1. 使用layui进行页面美化，[layui官网传送门](https://www.layui.com/doc/)
2. 前端使用Ajax向后端发送请求

## 后端
1. 需要fastjson插件，在pom文件中有坐标，建议使用1.2.72版本
2. mybatis的mapper文件在resources文件夹下的mapper中，若需要更改为其他位置需要在spring-dao.xml文件中
更改sqlSessionFactory下的mapperLocations指定的路径。
3. 日期处理：后端接收前端时需要在实体类中的加入``@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")``注解
，后端向前端发送数据时需要加入``@JSONField (format="yyyy-MM-dd'T'HH:mm")``。
    
    注：``@DataTimeFormat``注解需要在spring-web.xml中加入``  <mvc:annotation-driven />``开启注解驱动，
``@JSONField``注解需要fastjson支持，要在pom.xml中引入fastjson的坐标。

4. 分页使用LayuiPageHelper进行分页辅助
 


<%@ page import="com.t2010a.hellot2010aagain.entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: xuanhung
  Date: 5/12/22
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Student student = (Student)request.getAttribute("student");
%>
<jsp:include page="../includes/header.jsp">
    <jsp:param name="title" value="${student.getFullName()} | Student detail"/>
</jsp:include>
<jsp:include page="../includes/menu.jsp"></jsp:include>
    <a href="/admin/students/list">Back to list</a> &nbsp;
    <a href="/admin/students/create">Create new student</a>
    <div>
        Rollnumber: <%=student.getRollNumber()%>
    </div>
    <div>
        Fullname: <%=student.getFullName()%>
    </div>
<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>

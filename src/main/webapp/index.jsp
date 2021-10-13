<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <title>Insert title here</title>
            <%pageContext.setAttribute("APP_PATH",request.getContextPath());%>
                <script src="${APP_PATH }/static/bootstrap-3.4.1-dist/js/jquery.min.js"></script>
                <link href="${APP_PATH }/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="${APP_PATH }/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
        </head>

        <body>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>SSM-CRUD</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-8">
                        <button class="btn btn-primary" id="stu_add_modal_btn">新增</button>
                        <button class="btn btn-danger" id="stu_delete_all_btn">删除</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-hover" id="stus_table">
                            <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" id="check_all" />
                                    </th>
                                    <th>#</th>
                                    <th>stuName</th>
                                    <th>gender</th>
                                    <th>email</th>
                                    <th>deptName</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>

                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6" id="page_info_area"></div>
                    <div class="col-md-6" id="page_nav_area"></div>
                </div>
            </div>


            <div class="modal fade" id="stuAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">学生增加</h4>
                        </div>
                        <div class="modal-body">


                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">stuName</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="stuName" class="form-control" id="stuName_add_input" placeholder="stuName">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">email</label>
                                    <div class="col-sm-10">
                                        <input type="email" name="email" class="form-control" id="email_add_input" placeholder="email@email.com">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">gender</label>
                                    <div class="col-sm-10">

                                        <div class="radio">
                                            <label>
                      <input type="radio" name="gender" id="gender1_add_input" value="M" >男
                    </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                      <input type="radio" name="gender" id="gender2_add_input" value="F" checked>女
                    </label>
                                        </div>


                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">deptName</label>
                                    <div class="col-sm-4">
                                        <select class="form-control" name="dId" id="dept_add_select">

                  </select>
                                    </div>
                                </div>
                            </form>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="stu_save_btn">保存</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="stuUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">学生修改</h4>
                        </div>
                        <div class="modal-body">


                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">stuName</label>
                                    <div class="col-sm-10">
                                        <p class="form-control-static" id="stuName_update_static"></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">email</label>
                                    <div class="col-sm-10">
                                        <input type="email" name="email" class="form-control" id="email_update_input" placeholder="email@email.com">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">gender</label>
                                    <div class="col-sm-10">

                                        <div class="radio">
                                            <label>
                      <input type="radio" name="gender" id="gender1_update_input" value="M" >男
                    </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                      <input type="radio" name="gender" id="gender2_update_input" value="F" checked>女
                    </label>
                                        </div>


                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">deptName</label>
                                    <div class="col-sm-4">
                                        <select class="form-control" name="dId" id="dept_update_select">

                  </select>
                                    </div>
                                </div>
                            </form>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="stu_update_btn">更新</button>
                        </div>
                    </div>
                </div>
            </div>

        </body>
        <script type="text/javascript">
            var totalRecord, currentPage;
            $(function() {
                to_page(1);
            });

            function to_page(pn) {
                $.ajax({
                    url: "${APP_PATH}/stus",
                    data: "pn=" + pn,
                    type: "get",
                    success: function(result) {
                        //console.log(result);
                        build_stus_table(result);
                        build_page_info(result);
                        build_page_nav(result);
                    }
                })
            }

            function build_stus_table(result) {
                $("#stus_table tbody").empty();
                var stus = result.extend.pageInfo.list;
                $.each(stus, function(index, item) {
                    //console.log(item.name)
                    var checkboxTd = $("<td></td>").append($("<input type='checkbox' class='check_item'/>"))
                    var stusIdTd = $("<td></td>").append(item.stuId);
                    var stusNameTd = $("<td></td>").append(item.stuName);
                    var stusGenderTd = $("<td></td>").append(item.gender == "M" ? "男" : "女");
                    var stusEmailTd = $("<td></td>").append(item.email);
                    var stusDeptNameTd = $("<td></td>").append(item.department.deptName);
                    var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                        .append($("<span></span>").addClass("glyphicon glyphicon-pencil").attr("ariaHidden", "true").append("编辑"));
                    editBtn.attr("edit-id", item.stuId);
                    var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                        .append($("<span></span>").addClass("glyphicon glyphicon-trash").attr("ariaHidden", "true").append("删除"));
                    delBtn.attr("del-id", item.stuId);

                    var stusOperateTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                    $("<tr></tr>")
                        .append(checkboxTd)
                        .append(stusIdTd)
                        .append(stusNameTd)
                        .append(stusGenderTd)
                        .append(stusEmailTd)
                        .append(stusDeptNameTd)
                        .append(stusOperateTd)
                        .appendTo("#stus_table tbody")

                })
            }

            function build_page_info(result) {
                $("#page_info_area").empty();
                var pageInfo = result.extend.pageInfo;
                $("#page_info_area").append("当前第" + pageInfo.pageNum + "页,总" + pageInfo.pages + "页,总" + pageInfo.total + "条记录")
                totalRecord = pageInfo.total;
                currentPage = pageInfo.pageNum;
            }

            function build_page_nav(result) {
                $("#page_nav_area").empty();
                var pageInfo = result.extend.pageInfo;
                var ul = $("<ul></rl>").addClass("pagination");
                var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
                var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
                if (!pageInfo.hasPreviousPage) {
                    firstPageLi.addClass("disabled");
                    prePageLi.addClass("disabled");
                }
                firstPageLi.click(function() {
                    to_page(1);
                })
                prePageLi.click(function() {
                    to_page(pageInfo.pageNum - 1);
                })
                var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
                var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
                if (!pageInfo.hasNextPage) {
                    lastPageLi.addClass("disabled");
                    nextPageLi.addClass("disabled");
                }
                lastPageLi.click(function() {
                    to_page(pageInfo.pages);
                })
                nextPageLi.click(function() {
                    to_page(pageInfo.pageNum + 1);
                })
                ul.append(firstPageLi).append(prePageLi);
                $.each(pageInfo.navigatepageNums, function(index, item) {

                    var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
                    if (pageInfo.pageNum == item) {
                        numLi.addClass("active");
                    }
                    numLi.click(function() {
                        to_page(item);
                    })
                    ul.append(numLi);
                })
                ul.append(nextPageLi);
                ul.append(lastPageLi);
                var navEle = $("<nav></nav>").append(ul).appendTo("#page_nav_area");
            }

            $("#stu_add_modal_btn").click(function() {
                reset_from("#stuAddModal form");
                getDepts("#dept_add_select");
                $("#stuAddModal").modal({
                    backdrop: "static"
                })
            })

            function getDepts(ele) {
                $(ele).empty();
                $.ajax({
                    url: "${APP_PATH}/depts",
                    type: "get",
                    success: function(result) {
                        //console.log(result);
                        var depts = result.extend.depts;
                        $.each(depts, function() {
                            var optionEle = $("<option></oprion>").append(this.deptName).attr("value", this.deptId);
                            optionEle.appendTo(ele);
                        })
                    }
                })
            }

            $("#stuName_add_input").blur(function() {
                var stuName = this.value;
                $.ajax({
                    url: "${APP_PATH}/checkuser",
                    data: "stuName=" + stuName,
                    type: "post",
                    success: function(result) {
                        console.log(result);
                        var msg = result.extend.va_msg;
                        if (result.code == 200) {
                            show_validate_msg("#stuName_add_input", "success", "用户名可用");
                            $("#stu_save_btn").attr("ajax-val", "success");
                        } else {
                            show_validate_msg("#stuName_add_input", "error", msg);
                            $("#stu_save_btn").attr("ajax-val", "error");
                        }
                    }
                })
            })

            $("#stu_save_btn").click(function() {
                console.log("发送保存请求的param：" + $("#stuAddModal form").serialize())
                if (!validate_add_form()) {
                    return false;
                }
                if ($(this).attr("ajax-val") == "error") {
                    return false;
                }

                $.ajax({
                    url: "${APP_PATH}/stu",
                    type: "post",
                    data: $("#stuAddModal form").serialize(),
                    success: function(result) {
                        console.log(result);
                        if (result.code !== 200) {
                            var error = result.extend.errorFields;
                            if (undefined != error.email) {
                                show_validate_msg("#email_add_input", "error", error.email);
                            }
                            if (undefined != error.stuName) {
                                show_validate_msg("#stuName_add_input", "error", error.stuName);
                            }
                        } else {
                            $("#stuAddModal").modal("hide");
                            to_page(totalRecord + 1);
                        }
                    }
                })

            })

            function validate_add_form() {
                var name = $("#stuName_add_input").val();
                var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
                if (!regName.test(name)) {
                    //alert("用户名可以是2-5位中文和3-16位英文");
                    show_validate_msg("#stuName_add_input", "error", "用户名必须是2-5位中文和3-16位英文")
                    return false;
                }

                show_validate_msg("#stuName_add_input", "success", "")
                var email = $("#email_add_input").val();
                var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                if (!regEmail.test(email)) {
                    //alert("邮箱格式错误");
                    show_validate_msg("#email_add_input", "error", "邮箱格式错误")
                    return false;
                }
                show_validate_msg("#email_add_input", "success", "")
                return true;
            }

            function show_validate_msg(ele, status, msg) {
                $(ele).parent().removeClass("has-success has-error");
                $(ele).next("span").text("");
                if ("success" == status) {
                    $(ele).parent().addClass("has-success");
                    $(ele).next("span").text(msg);
                } else if ("error" == status) {
                    $(ele).parent().addClass("has-error");
                    $(ele).next("span").text(msg);
                }

            }

            function reset_from(ele) {
                $(ele)[0].reset();
                $(ele).find("*").removeClass("has-error has-success");
                $(ele).find(".help-block").text("");
            }
            $(document).on("click", ".edit_btn", function() {

                getStu($(this).attr("edit-id"));
                getDepts("#stuUpdateModal select");
                $("#stuUpdateModal").attr("edit-id", $(this).attr("edit-id"));
                $("#stuUpdateModal").modal({
                        backdrop: "static"
                    })
                    //stuName_update_static
            })

            function getStu(id) {
                $.ajax({
                    url: "${APP_PATH}/stu/" + id,
                    type: "get",
                    success: function(result) {
                        var stu = result.extend.stu;
                        $("#stuName_update_static").text(stu.stuName);
                        $("#email_update_input").val(stu.email);
                        $("#stuUpdateModal input[name=gender]").val([stu.gender]);
                        $("#stuUpdateModal select").val([stu.dId]);

                    }
                })
            }
            $("#stu_update_btn").click(function() {
                var email = $("#email_update_input").val();
                var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                if (!regEmail.test(email)) {
                    //alert("邮箱格式错误");
                    show_validate_msg("#email_update_input", "error", "邮箱格式错误")
                    return false;
                } else {
                    show_validate_msg("#email_update_input", "success", "")
                }
                $.ajax({
                    url: "${APP_PATH}/stu/" + $("#stuUpdateModal").attr("edit-id"),
                    type: "PUT",
                    data: $("#stuUpdateModal form").serialize(),
                    success: function(result) {
                        $("#stuUpdateModal").modal("hide");
                        to_page(currentPage);
                    }
                })
            })
            $(document).on("click", ".delete_btn", function() {
                var stuName = $(this).parents("tr").find("td:eq(2)").text()
                if (confirm("确定删除【" + stuName + "】吗?")) {

                    $.ajax({
                        url: "${APP_PATH}/stu/" + $(this).attr("del-id"),
                        type: "DELETE",
                        success: function(result) {
                            to_page(currentPage);
                        }
                    })
                }

            })
            $("#check_all").click(function() {
                $(".check_item").prop("checked", $(this).prop("checked"));
            })
            $(document).on("click", ".check_item", function() {
                // $("#check_all").prop("checked")
                var flag = $(".check_item").length == $(".check_item:checked").length;
                $("#check_all").prop("checked", flag);

            })
            $("#stu_delete_all_btn").click(function() {
                var stuNames = "";
                var del_idstr = ""
                $.each($(".check_item:checked"), function() {
                    stuNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
                    del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
                })
                stuNames = stuNames.substring(0, stuNames.length - 1);
                del_idstr = del_idstr.substring(0, del_idstr.length - 1);
                if (confirm("确认删除【" + del_idstr + "】吗？")) {
                    $.ajax({
                        url: "${APP_PATH}/stu/" + del_idstr,
                        type: "DELETE",
                        success: function(result) {
                            alert(result.msg);
                            to_page(currentPage);
                        }
                    })
                }


            })
        </script>

        </html>
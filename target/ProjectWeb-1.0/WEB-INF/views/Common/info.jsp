<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
    
<div class="col-md-9 col-sm-12">
    <div class="blk-user-right blk-user-bor full d-block">
        <header>
            <h1>${title}</h1>
            <div class="content">${titleTwo}</div>
        </header>
       
        <!-- Thông báo thành công -->
	    <c:if test="${not empty success}">
	        <div class="alert alert-success">${success}</div>
	    </c:if>
        <frm:form id="formAcount" action="/ProjectWeb/user/profile/edit" method="POST" class="formAcount validate clearfix" modelAttribute="user">
            <div class="form-group clearfix">
                <div class="row">
                    <frm:label class="col-md-3 control-label" path="hoTen">Họ tên: <span>(*)</span></frm:label>
                    <div class="col-lg-6 col-md-9">
                        <frm:input path="hoTen" id="fullName" placeholder="Họ tên" class="validate[required,minSize[4],maxSize[32]] form-control input-sm"/>
                    </div>
                </div>
            </div>
            <div class="form-group clearfix">
                <div class="row">
                    <label class="col-md-3 control-label">Ngày sinh: <span>(*)</span></label>
                    <div class="col-lg-6 col-md-9">
                        <frm:input path="ngaySinh" id="birthday" type="date" placeholder="Ngày sinh" class="validate[required] form-control input-sm"/>
                    </div>
                </div>
            </div>
            <div class="form-group clearfix">
                <div class="row">
                    <label class="col-md-3 control-label">Điện thoại: <span>(*)</span></label>
                    <div class="col-lg-6 col-md-9">
                        <frm:input path="sdt" id="mobile" placeholder="Điện thoại" class="validate[required,custom[phone]] form-control input-sm"/>
                    </div>
                </div>
            </div>
            <div class="form-group clearfix">
                <div class="row">
                    <label class="col-md-3 control-label">Email: <span>(*)</span></label>
                    <div class="col-lg-6 col-md-9">
                        <frm:input path="email" id="email" placeholder="Email" class="validate[required,custom[email]] form-control input-sm"/>
                    </div>
                </div>
            </div>
            <div class="form-group clearfix">
                <div class="row">
                    <label class="col-md-3 control-label">Địa chỉ chi tiết:  <span>(*)</span></label>
                    <div class="col-lg-6 col-md-9">
                        <frm:input path="diaChi" id="address" placeholder="Địa chỉ chi tiết" class="validate[required] form-control input-sm"/>
                    </div>
                </div>
            </div>
            <div class="form-group clearfix">
                <div class="row">
                    <label class="col-md-3 control-label"></label>
                    <div class="col-lg-6 col-md-9">
                        <button type="submit" class="btn btn-pink">Cập nhật</button>
                    </div>
                </div>
            </div>
        </frm:form>
    </div>
</div>
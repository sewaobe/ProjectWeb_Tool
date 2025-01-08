<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
    
<div class="col-md-9 col-sm-12">
    <div class="blk-user-right blk-user-bor full d-block">
        <header>
            <h1>THAY ĐỔI MẬT KHẨU</h1>
            <div class="content">Bạn nên cập nhập mật khẩu thường xuyên vì lý do bảo mật</div>
        </header>
        <!-- Thông báo lỗi -->
	    <c:if test="${not empty error}">
	        <div class="alert alert-danger">${error}</div>
	    </c:if>
	
	    <!-- Thông báo thành công -->
	    <c:if test="${not empty success}">
	        <div class="alert alert-success">${success}</div>
	    </c:if>
        <form id="formAcount" method="POST" class="formAcount validate clearfix" method="post">
            <div class="form-group clearfix">
                <div class="row">
                    <label for="oldpassword" class="col-lg-3 col-md-3 required control-label">Mật khẩu cũ: </label>
                    <div class="col-lg-6 col-md-9">
                        <input type="password" id="oldpassword" name="oldpassword" placeholder="Mật khẩu cũ" class="validate[required],minSize[6] form-control input-sm" required>
                    </div>
                </div>
            </div>
            <div class="form-group clearfix">
                <div class="row">
                    <label for="newpassword" class="col-lg-3 col-md-3 required control-label">Mật khẩu mới: </label>
                    <div class="col-lg-6 col-md-9">
                        <input type="password" id="newpassword" name="newpassword" placeholder="Mật khẩu mới" class="validate[required],minSize[6] form-control input-sm" required>
                    </div>
                </div>
            </div>
            <div class="form-group clearfix">
                <div class="row">
                    <label for="repassword" class="col-lg-3 col-md-3 required control-label">Xác nhận mật khẩu: </label>
                    <div class="col-lg-6 col-md-9">
                        <input type="password" id="repassword" name="repassword" placeholder="Xác nhận mật khẩu" class="validate[required],minSize[6] form-control input-sm" required>
                    </div>
                </div>
            </div>
            <div class="form-group clearfix">
                <div class="row">
                    <label for="repassword" class="col-lg-3 col-md-3 required control-label"></label>
                    <div class="col-lg-6 col-md-9">
                        <button type="submit" class="btn btn-pink">Xác nhận</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
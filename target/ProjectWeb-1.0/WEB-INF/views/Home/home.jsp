 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <div class="slider-group">
            <div class="row">
                <div class="col-slider col-lg-9 col-12">
                    <div class="banner-full owl-full owl-carousel owl-theme" data-loop="true">
                        <a href="https://s.net.vn/DVl4" target="_self">
                            <img src="https://pos.nvncdn.com/cba2a3-7534/bn/20241202_hneawmr0.gif" alt="Blindbox">
                        </a>
                        <a href="#" target="_blank">
                            <img src="https://pos.nvncdn.com/cba2a3-7534/bn/20241130_9ChwbbG5.gif" alt="PQT - Xmas 2024">
                        </a>
                        <a href="#" target="_self">
                            <img src="https://pos.nvncdn.com/cba2a3-7534/bn/20241111_NExV1ZDW.gif" alt="Season Gift 2024 highlight">
                        </a>
                        <a href="#" target="_self">
                            <img src="https://pos.nvncdn.com/cba2a3-7534/bn/20241121_YxHc3lL0.gif" alt="Set quà yêu thương">
                        </a>
                    </div>
                </div>
                <div class="col-slider col-lg-3 d-none d-lg-block">
                    <div class="banner-right owl-full owl-carousel owl-theme" data-loop="false">
                        <a href="#" target="_self">
                            <img src="https://pos.nvncdn.com/cba2a3-7534/bn/20241122_dN711Y9N.gif" alt="YT -Đồ đông">
                        </a>
                    </div>
                    <div class="banner-right owl-full owl-carousel owl-theme" data-loop="false">
                        <a href="#" target="_self">
                            <img src="https://pos.nvncdn.com/cba2a3-7534/bn/20241116_aoNtG8BI.gif" alt="PTC - Đồ đông 2024">
                        </a>
                    </div>
                </div>
            </div>
        </div>
        

<main class="main">
            <div class="container">
                <div class="row">
                    <div class="blk-product-new col-12" data-label="product new">
                        <h2 class="title">
                            <a href="/ProjectWeb/product?c=tat-ca&page=1">Sản phẩm mới                        </a>
                        </h2>
                        <div class="product-list">
                            <div id="rs-js-product" class="row">
                            <c:forEach items="${listProduct}" var="product">
                             	<div class="product-item item${product.maSP} col-xl-3 col-md-4 col-6 col-xxs-12" data-psid="${product.maSP}">
                                    <div class="image">
                                        <span class="flag">New</span>
                                        <a href="/ProjectWeb/product?q=${product.maSP}&c=${product.loaiSanPham}" title="${product.ten}">
                                            <img data-sizes="auto" class="lazyload" src="https://web.nvnstatic.net/img/lazyLoading.gif?v=3" data-src="${pageContext.request.contextPath}${product.hinhAnh}" alt="${product.ten}">
                                        </a>
                                        <div class="product-action d-flex align-center justify-content-center">
                                            <div class="wish" data-psId="${product.maSP}"></div>
                                            <div class="js-add-cart" data-psId="${product.maSP}" data-root="-2"></div>
                                        </div>
                                    </div>
                                    <h3 class="name">
                                        <a href="/ProjectWeb/product?q=${product.maSP}&c=${product.loaiSanPham}" title="${product.ten}">${product.ten}                                        </a>
                                    </h3>
                                    <div class="product-price">
                                        <span class="price">	<fmt:formatNumber value="${product.gia}" pattern="#,###" />đ</span>
                                    </div>
                                </div>
                            </c:forEach>
                               
                                
                            </div>
                        </div>
                        <div class="col text-center">
                            <a id="js-btn-load-product" data-offset="12" href="/ProjectWeb/product?c=tat-ca&page=1" class="btn btn-pink pointer d-load-flex align-items-center">XEM THÊM</a>
                        </div>
                    </div>
                    <div class="blk-banner col-12" data-label="campaigns">
                        <h2 class="title">Chủ đề mới</h2>
                        <div class="row">
                            <div class="item pointer col-xl-3 col-md-4 col-6 active" data-id="4494" data-href="/do-giu-am-cp4494.html" data-offset="0" data-label="campaign">
                                <img data-sizes="auto" class="lazyload" src="https://web.nvnstatic.net/img/lazyLoading.gif?v=3" data-src="https://pos.nvncdn.com/cba2a3-7534/campaign/20241130_lU0S5e5d.png" alt="Đồ giữ ấm">
                            </div>
                            <div class="item pointer col-xl-3 col-md-4 col-6 " data-id="4493" data-href="/trang-suc-cp4493.html" data-offset="0" data-label="campaign">
                                <img data-sizes="auto" class="lazyload" src="https://web.nvnstatic.net/img/lazyLoading.gif?v=3" data-src="https://pos.nvncdn.com/cba2a3-7534/campaign/20241130_YePaZExT.png" alt="Trang sức">
                            </div>
                            <div class="item pointer col-xl-3 col-md-4 col-6 " data-id="4492" data-href="/snowman-cp4492.html" data-offset="0" data-label="campaign">
                                <img data-sizes="auto" class="lazyload" src="https://web.nvnstatic.net/img/lazyLoading.gif?v=3" data-src="https://pos.nvncdn.com/cba2a3-7534/campaign/20241130_0U7qqRRb.png" alt="Snowman">
                            </div>
                            <div class="item pointer col-xl-3 col-md-4 col-6 " data-id="4491" data-href="/labubu-cp4491.html" data-offset="0" data-label="campaign">
                                <img data-sizes="auto" class="lazyload" src="https://web.nvnstatic.net/img/lazyLoading.gif?v=3" data-src="https://pos.nvncdn.com/cba2a3-7534/campaign/20241130_vOvcGThN.png" alt="Labubu">
                            </div>
                        </div>
                    </div>
                    <div class="blk-product-home col-12" data-label="product campaigns">
                        <div class="product-list">
                            <div id="js-camp-pro" class="row justify-content-center">
                                <div class="product-item item37919550 col-xl-3 col-md-4 col-6 col-xxs-12" data-psId="37919550">
                                    <div class="image">
                                        <a href="/khan-len-cashmere-soc-ngang-phoi-mau-gan-soc-cheo-65x200-p37919550.html" title="Khăn len cashmere Sọc ngang phối màu gân sọc chéo 65x200">
                                            <img data-sizes="auto" class="lazyload" src="https://web.nvnstatic.net/img/lazyLoading.gif?v=3" data-src="https://pos.nvncdn.com/cba2a3-7534/ps/20241010_2I68kxEqxN.jpeg" alt="Khăn len cashmere Sọc ngang phối màu gân sọc chéo 65x200">
                                        </a>
                                        <div class="product-action d-flex align-center justify-content-center">
                                            <div class="wish" data-psId="37919550"></div>
                                            <div class="js-add-cart" data-psId="37919550" data-root="-2"></div>
                                        </div>
                                    </div>
                                    <h3 class="name">
                                        <a href="/khan-len-cashmere-soc-ngang-phoi-mau-gan-soc-cheo-65x200-p37919550.html" title="Khăn len cashmere Sọc ngang phối màu gân sọc chéo 65x200">Khăn len cashmere Sọc ngang phối màu gân sọc chéo 65x200                                                </a>
                                    </h3>
                                    <div class="product-price">
                                        <span class="price">
                                            160.000<sub>đ</sub>
                                        </span>
                                    </div>
                                </div>
                                <div class="product-item item37919665 col-xl-3 col-md-4 col-6 col-xxs-12" data-psId="37919665">
                                    <div class="image">
                                        <a href="/mu-len-long-xu-tai-tho-o-vuong-vien-long-p37919665.html" title="Mũ len lông xù Tai thỏ ô vuông viền lông">
                                            <img data-sizes="auto" class="lazyload" src="https://web.nvnstatic.net/img/lazyLoading.gif?v=3" data-src="https://pos.nvncdn.com/cba2a3-7534/ps/20241006_i9OiHCsBOR.jpeg" alt="Mũ len lông xù Tai thỏ ô vuông viền lông">
                                        </a>
                                        <div class="product-action d-flex align-center justify-content-center">
                                            <div class="wish" data-psId="37919665"></div>
                                            <div class="js-add-cart" data-psId="37919665" data-root="-2"></div>
                                        </div>
                                    </div>
                                    <h3 class="name">
                                        <a href="/mu-len-long-xu-tai-tho-o-vuong-vien-long-p37919665.html" title="Mũ len lông xù Tai thỏ ô vuông viền lông">Mũ len lông xù Tai thỏ ô vuông viền lông                                                </a>
                                    </h3>
                                    <div class="product-price">
                                        <span class="price">
                                            120.000<sub>đ</sub>
                                        </span>
                                    </div>
                                </div>
                                <div class="product-item item37920465 col-xl-3 col-md-4 col-6 col-xxs-12" data-psId="37920465">
                                    <div class="image">
                                        <a href="/dep-bong-funny-vibes-face-moi-day-p37920465.html" title="Dép bông Funny vibes face môi dày">
                                            <img data-sizes="auto" class="lazyload" src="https://web.nvnstatic.net/img/lazyLoading.gif?v=3" data-src="https://pos.nvncdn.com/cba2a3-7534/ps/20241020_RoXjIR7GJ3.jpeg" alt="Dép bông Funny vibes face môi dày">
                                        </a>
                                        <div class="product-action d-flex align-center justify-content-center">
                                            <div class="wish" data-psId="37920465"></div>
                                            <div class="js-add-cart" data-psId="37920465" data-root="-2"></div>
                                        </div>
                                    </div>
                                    <h3 class="name">
                                        <a href="/dep-bong-funny-vibes-face-moi-day-p37920465.html" title="Dép bông Funny vibes face môi dày">Dép bông Funny vibes face môi dày                                                </a>
                                    </h3>
                                    <div class="product-price">
                                        <span class="price">
                                            220.000<sub>đ</sub>
                                        </span>
                                    </div>
                                </div>
                                <div class="product-item item37920668 col-xl-3 col-md-4 col-6 col-xxs-12" data-psId="37920668">
                                    <div class="image">
                                        <span class="flag">New</span>
                                        <a href="/bit-tai-len-cute-cat-face-mat-long-lanh-co-tai-p37920668.html" title="Bịt tai len Cute cat face mắt long lanh có tai">
                                            <img data-sizes="auto" class="lazyload" src="https://web.nvnstatic.net/img/lazyLoading.gif?v=3" data-src="https://pos.nvncdn.com/cba2a3-7534/ps/20241017_UcuE3uLaM3.jpeg" alt="Bịt tai len Cute cat face mắt long lanh có tai">
                                        </a>
                                        <div class="product-action d-flex align-center justify-content-center">
                                            <div class="wish" data-psId="37920668"></div>
                                            <div class="js-add-cart" data-psId="37920668" data-root="-2"></div>
                                        </div>
                                    </div>
                                    <h3 class="name">
                                        <a href="/bit-tai-len-cute-cat-face-mat-long-lanh-co-tai-p37920668.html" title="Bịt tai len Cute cat face mắt long lanh có tai">Bịt tai len Cute cat face mắt long lanh có tai                                                </a>
                                    </h3>
                                    <div class="product-price">
                                        <span class="price">
                                            70.000<sub>đ</sub>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col text-center">
                            <a id="js-btn-load-cam" href="/do-giu-am-cp4494.html" class="btn btn-pink">XEM THÊM</a>
                        </div>
                    </div>
                    <div class="blk-collection col-12">
    <h2 class="title">
        <a href="/bo-suu-tap-ac337.html">
        Bộ sưu tập                        </a>
    </h2>
    <div class="row">
        <div class="owl-carousel owl-theme owl-pink owl-loaded owl-drag">
            <div class="owl-stage-outer">
                <div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all; width: 43547px;">
                    <div class="owl-item active" style="width: 236.667px;">
                        <div class="item">
                            <a href="https://s.net.vn/G2H6" target="_self" title="Chiikawa">
                            <img data-sizes="auto" class="lazyautosizes lazyloaded" src="https://pos.nvncdn.com/cba2a3-7534/bn/20241122_XIt9QqNk.gif" data-src="https://pos.nvncdn.com/cba2a3-7534/bn/20241122_XIt9QqNk.gif" alt="Chiikawa" sizes="217px">
                            </a>
                            <div class="collec-title d-flex align-items-center justify-content-center">
                                <a href="https://s.net.vn/G2H6" target="_self" title="Chiikawa">
                                Chiikawa                                        </a>
                            </div>
                        </div>
                    </div>
                    <div class="owl-item active" style="width: 236.667px;">
                        <div class="item">
                            <a href="https://s.net.vn/3XWq" target="_self" title="Bộ sưu tập hàng Xmas">
                            <img data-sizes="auto" class="lazyautosizes lazyloaded" src="https://pos.nvncdn.com/cba2a3-7534/bn/20241114_XUrzpzQ3.gif" data-src="https://pos.nvncdn.com/cba2a3-7534/bn/20241114_XUrzpzQ3.gif" alt="Bộ sưu tập hàng Xmas" sizes="217px">
                            </a>
                            <div class="collec-title d-flex align-items-center justify-content-center">
                                <a href="https://s.net.vn/3XWq" target="_self" title="Bộ sưu tập hàng Xmas">
                                Bộ sưu tập hàng Xmas                                        </a>
                            </div>
                        </div>
                    </div>
                    <div class="owl-item active" style="width: 236.667px;">
                        <div class="item">
                            <a href="https://s.net.vn/XPqa" target="_self" title="Vô vàn gấu Capybara">
                            <img data-sizes="auto" class="lazyautosizes lazyloaded" src="https://pos.nvncdn.com/cba2a3-7534/bn/20241107_qzyZYNGD.gif" data-src="https://pos.nvncdn.com/cba2a3-7534/bn/20241107_qzyZYNGD.gif" alt="Vô vàn gấu Capybara" sizes="217px">
                            </a>
                            <div class="collec-title d-flex align-items-center justify-content-center">
                                <a href="https://s.net.vn/XPqa" target="_self" title="Vô vàn gấu Capybara">
                                Vô vàn gấu Capybara                                        </a>
                            </div>
                        </div>
                    </div>
                    <div class="owl-item" style="width: 236.667px;">
                        <div class="item">
                            <a href="https://s.net.vn/VcgX" target="_self" title="Móc khóa xinh">
                            <img data-sizes="auto" class="lazyautosizes lazyloaded" src="https://pos.nvncdn.com/cba2a3-7534/bn/20241031_UtXAbMOc.gif" data-src="https://pos.nvncdn.com/cba2a3-7534/bn/20241031_UtXAbMOc.gif" alt="Móc khóa xinh" sizes="217px">
                            </a>
                            <div class="collec-title d-flex align-items-center justify-content-center">
                                <a href="https://s.net.vn/VcgX" target="_self" title="Móc khóa xinh">
                                Móc khóa xinh                                        </a>
                            </div>
                        </div>
                    </div>
                    <div class="owl-item" style="width: 236.667px;">
                        <div class="item">
                            <a href="https://s.net.vn/PPfj" target="_self" title="Gấu bông cư tê">
                            <img data-sizes="auto" class="lazyautosizes lazyloaded" src="https://pos.nvncdn.com/cba2a3-7534/bn/20241018_03swV404.gif" data-src="https://pos.nvncdn.com/cba2a3-7534/bn/20241018_03swV404.gif" alt="Gấu bông cư tê" sizes="217px">
                            </a>
                            <div class="collec-title d-flex align-items-center justify-content-center">
                                <a href="https://s.net.vn/PPfj" target="_self" title="Gấu bông cư tê">
                                Gấu bông cư tê                                        </a>
                            </div>
                        </div>
                    </div>
                    <div class="owl-item" style="width: 236.667px;">
                        <div class="item">
                            <a href="https://s.net.vn/xZ6d" target="_self" title="Sanrio cực xinh">
                            <img data-sizes="auto" class="lazyautosizes lazyloaded" src="https://pos.nvncdn.com/cba2a3-7534/bn/20241011_Ap5SAKlp.gif" data-src="https://pos.nvncdn.com/cba2a3-7534/bn/20241011_Ap5SAKlp.gif" alt="Sanrio cực xinh" sizes="217px">
                            </a>
                            <div class="collec-title d-flex align-items-center justify-content-center">
                                <a href="https://s.net.vn/xZ6d" target="_self" title="Sanrio cực xinh">
                                Sanrio cực xinh                                        </a>
                            </div>
                        </div>
                    </div>
                    <div class="owl-item" style="width: 236.667px;">
                        <div class="item">
                            <a href="https://s.net.vn/NNpo" target="_self" title="Butter bear">
                            <img data-sizes="auto" class="lazyautosizes lazyloaded" src="https://pos.nvncdn.com/cba2a3-7534/bn/20241003_KrpnFq9E.gif" data-src="https://pos.nvncdn.com/cba2a3-7534/bn/20241003_KrpnFq9E.gif" alt="Butter bear" sizes="217px">
                            </a>
                            <div class="collec-title d-flex align-items-center justify-content-center">
                                <a href="https://s.net.vn/NNpo" target="_self" title="Butter bear">
                                Butter bear                                        </a>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="owl-nav"><button type="button" role="presentation" class="owl-prev disabled"><i class="fa fa-angle-left "></i></button><button type="button" role="presentation" class="owl-next"><i class="fa fa-angle-right"></i></button></div>
            <div class="owl-dots"><button role="button" class="owl-dot active"><span></span></button></div>
        </div>
    </div>
</div>
                </div>
            </div>
        </main>
        
        
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/homeJS.js">

</script>
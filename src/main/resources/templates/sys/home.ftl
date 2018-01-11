<!DOCTYPE html>
<html ng-app="PowerTeam" class="login">
<head>
    <base href="${PowerTeam.webRoot}">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=11"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>${PowerTeam.title}</title>
    <#include "../shared/cssAndJs.ftl">
    <script src="js/controller/sys/home.js?v=${PowerTeam.staticV}"></script>
</head>
<body>
<div class="login-box" ng-controller="signIn">
    <div class="login-box-body">
        <div class="login-logo">
            <a href="${PowerTeam.webRoot}"><b>${PowerTeam.title}</b></a>
        </div>
        <p class="login-box-msg">疾如风，徐如林!</p>
        <form>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" ng-model="User.userName" placeholder="用户名">
                <span class="fa fa-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" ng-model="User.password" placeholder="密码">
                <span class="fa fa-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <div id="drag"></div>
            </div>
            <div class="row form-group has-feedback">
                <div class="col-xs-offset-0 col-xs-12">
                    <#--白色 btn
                        浅蓝色 btn btn-primary
                        深蓝色 btn btn-info
                        绿色 btn btn-success
                        黄色 btn btn-warning
                        红色 btn btn-danger
                        黑色 btn btn-inverse-->
                    <button ng-click="loginSystem();" class="btn btn-success btn-block btn-flat" ng-disabled="loading">登陆</button>
                </div>
            </div>
            <div class="row form-group has-feedback">
                <div class="col-xs-offset-0 col-xs-12">
                    <button ng-click="forgotPassword();" class="btn btn-block btn-flat">忘记密码?</button>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-offset-0 col-xs-12">
                    <button ng-click="showAdd();" class="btn btn-primary btn-block btn-flat" ng-disabled="loading">注册</button>
                </div>
            </div>
        </form>
    </div>
</div>
<#--注册弹窗-->
<script type="text/ng-template" id="Add.html">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" ng-click="cancel()"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加新用户</h4>
            </div>
            <div class="modal-body">
                <form role="form" name="form" novalidate>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label>用户名 <span class="text-red">*</span></label>
                                <input type="text" class="form-control" name="userName" ng-model="Model.userName" placeholder="用户名" required maxlength="30" ng-ajax="user/checkUserName">
                                <div ng-show="form.userName.$dirty && form.userName.$error.required" class="text-red">请输入用户名</div>
                                <div ng-show="form.userName.$dirty && form.userName.$error.ngAjax" class="text-red">用户名已存在</div>
                            </div>
                            <div class="form-group">
                                <label>真实姓名 <span class="text-red">*</span></label>
                                <input type="text" class="form-control" name="realName" ng-model="Model.realName" placeholder="真实姓名" required maxlength="10">
                                <div ng-show="form.realName.$dirty && form.realName.$error.required" class="text-red">请输入真实姓名</div>
                            </div>
                            <div class="form-group">
                                <label>密码 <span class="text-red">*</span></label>
                                <input type="password" class="form-control" name="password" ng-model="Model.password" placeholder="密码" required maxlength="30">
                                <div ng-show="form.password.$dirty && form.password.$error.required" class="text-red">请输入密码</div>
                            </div>
                            <div class="form-group">
                                <label>确认密码 <span class="text-red">*</span></label>
                                <input type="password" class="form-control" name="passwordConfirm" ng-model="passwordConfirm" placeholder="确认密码" required maxlength="30" ng-match="Model.password">
                                <div ng-show="form.passwordConfirm.$dirty && form.passwordConfirm.$error.required" class="text-red">请输入确认密码</div>
                                <div ng-show="form.passwordConfirm.$dirty && form.passwordConfirm.$error.ngMatch" class="text-red">两次密码不匹配</div>
                            </div>
                            <div class="form-group">
                                <label>头像</label>
                                <br>
                                <label class="img-picker">
                                    <input type="radio" name="avatar" ng-model="Model.avatar" ng-value="'img/avatar/avatar1.png'"> <img src="img/avatar/avatar1.png" class="img-circle img64">
                                </label>
                                <label class="img-picker">
                                    <input type="radio" name="avatar" ng-model="Model.avatar" ng-value="'img/avatar/avatar2.png'"> <img src="img/avatar/avatar2.png" class="img-circle img64">
                                </label>
                                <label class="img-picker">
                                    <input type="radio" name="avatar" ng-model="Model.avatar" ng-value="'img/avatar/avatar3.png'"> <img src="img/avatar/avatar3.png" class="img-circle img64">
                                </label>
                                <label class="img-picker">
                                    <input type="radio" name="avatar" ng-model="Model.avatar" ng-value="'img/avatar/avatar4.png'"> <img src="img/avatar/avatar4.png" class="img-circle img64">
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" ng-model="Model.gender" ng-value="1"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" ng-model="Model.gender" ng-value="0"> 女
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="cancel()"><i class="fa fa-close"></i> 关闭</button>
                <button type="button" class="btn fa-key" ng-disabled="form.$invalid || loading" ng-click="ok()"><i class="fa fa-save"></i> 注册</button>
            </div>
        </div>
    </div>
</script>
<#--忘记密码-->
<script type="text/ng-template" id="Forgot.html">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" ng-click="cancel()"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">密保验证</h4>
            </div>
            <div class="modal-body">
                <form role="form" name="form" novalidate>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label>密保问题一 <span class="text-red">*</span></label>
                                <input type="text" class="form-control" name="realName" ng-model="Model.realName" placeholder="真实姓名" required maxlength="10">
                                <div ng-show="form.realName.$dirty && form.realName.$error.required" class="text-red">请输入真实姓名</div>
                            </div>
                            <div class="form-group">
                                <label>答案 <span class="text-red">*</span></label>
                                <input type="text" class="form-control" name="userName" ng-model="Model.userName" placeholder="用户名" required maxlength="30" ng-ajax="user/checkUserName">
                                <div ng-show="form.userName.$dirty && form.userName.$error.required" class="text-red">请输入用户名</div>
                                <div ng-show="form.userName.$dirty && form.userName.$error.ngAjax" class="text-red">用户名已存在</div>
                            </div>
                            <div class="form-group">
                                <label>密保问题二 <span class="text-red">*</span></label>
                                <input type="password" class="form-control" name="password" ng-model="Model.password" placeholder="密码" required maxlength="30">
                                <div ng-show="form.password.$dirty && form.password.$error.required" class="text-red">请输入密码</div>
                            </div>
                            <div class="form-group">
                                <label>答案 <span class="text-red">*</span></label>
                                <input type="text" class="form-control" name="userName" ng-model="Model.userName" placeholder="用户名" required maxlength="30" ng-ajax="user/checkUserName">
                                <div ng-show="form.userName.$dirty && form.userName.$error.required" class="text-red">请输入用户名</div>
                                <div ng-show="form.userName.$dirty && form.userName.$error.ngAjax" class="text-red">用户名已存在</div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="cancel()"><i class="fa fa-close"></i> 关闭</button>
                <button type="button" class="btn btn-primary" ng-disabled="form.$invalid || loading" ng-click="submit()"><i class="fa fa-magic"></i> 找回</button>
            </div>
        </div>
    </div>
</script>
</body>
</html>
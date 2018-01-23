<%--
  Created by IntelliJ IDEA.
  User: 陶鹏飞
  Date: 2017/10/10
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
<head>
    <title>登录模板</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="views/e_sso_style.css" type="text/css" media="print, screen">
    <script type="text/javascript" language="JavaScript" src="views/e_moc_lib.js"></script>
    <script type="text/javascript" language="JavaScript" src="views/e_sso_check.js"></script>
    <style>
        html {  display: none;  }
    </style>
    <script>
        if (self == top) {
            document.documentElement.style.display = 'block';
        }
        else {
            top.location = self.location;
        }
    </script>
    <script>stripHTML();</script>
</head>
<body class="f17 f17v2" onLoad="doLoad();">
    <div class="f17w1">
        <div class="f17w2" style="display:none">
            <%--<img src="https://login.oracle.com/mysso/sso_loginui/sso-f17v2-bgimg.jpg">--%>
                <img src="../img/bglogin.jpg">
        </div>
        <!-- U16v0 -->
        <%--<div id="u16" class="u16 u16v0">
            <div class="u16w1">
                &lt;%&ndash;<a href="#" tabindex="9">Pentaho</a>&ndash;%&gt;
                    <span >Pentaho</span>
            </div>
        </div>--%>
        <!-- /U16v0 -->
        <!-- CB41v0 -->
        <div class="cb41 cb41v0">
            <input type="hidden" name="request_id" value="4638352964200662642">
            <div class="cb41w1">
                <h2> 登录</h2>
                <form method="post" action="/oam/server/sso/auth_cred_submit" name="LoginForm" autocomplete="off">
                    <ul>
                        <input type="hidden" name="v" value="v1.4">
                        <input type="hidden" name="OAM_REQ"
                               value="VERSION_4~6bMWn5e52fVIA94lAP6THZ9oQS3GocKwc2XnhGuby%2b80UirSs%2buGzJ53DFqtpJ4SXru2gNCf4xoivTzSJQjyPzs3s0kGdrUkX%2fi3n4rrEWPg1yarGvVs1dHyeSoo3y3WCfux7PbaFiJU1sxyNZAPCmOYZGyU0drELKZHhcdVZZFuOXiF0AMPDfciIfc%2bOAFFdvS%2fHUDpBavnY8y%2fcewfhclQH%2ftdKdBp0Mm72mJj2FPdYB6YASlf%2fIUK6d47YpulBzuo%2fBB3busvLCB6mc6vfhsiYVTiHTn%2fnML20pAiuwU%2fnnG7kDOE82NLMA0jVOY1hiYoNpwpUZYTRmIYbSbqB8x5YdmFsCw8bBHLSO33moEcauyDyflDVsNwvHwRFfNTfmJGvoJ2cBDQnZi%2bXr0ISNVWcfm7ciB%2f7Nf2w6nSf33Gcv5acy2Qxe5kRyw7UABZI5JKecB4MtjhxaMzXu6%2bPHKv%2feMmI33BdKdXQYYxpE%2fBrRRoJUZQ62g8x3O6vWjbqkfbGDMLU0zp9JoH0QJi%2fnObZOPJz1n2hsqE9gPh4i9TX7G3PlXp8KGvV9jdfqnp9aIlsI0iRo0gNAWHQIszbxD2XnTHHtavuIFOMWIwybwUDNWVwD2jxlGqzYcEubuAQ7tO%2bxGjkH8sMeuCrfigeS%2b8eqSacvAhUKyQ6ac59MJHG9lcUdQMIulJM04mnDasMqLuYN3v7fG0UKP9Iv5jsSRYhYXtvOGVE%2fsP4a6Omq7esglUqFsL%2bcTqSpwfGgt5yEvEwSkN3mYiTl8%2fLVNRyUWQeTdPSLmnNZ82EnEYEZZkv%2fm7nxp9SoOaE%2bFVVAVMhwuXlrKHWUkKwvpRrzHgWmGWjnERSiX%2beudsIK13RxETSlDnMyjBvsN2iOjiIrJtIzcI4zErh5TdYncxUi0Ewq8wPLPfDPK83FQa2k%2f1gPUAu3rGMfjX%2bfptFvIZqHnBF4ReQ4%2bKEZ%2bhvZWyLc4FTGVAOpZr%2f%2bk2Fk992EhycEOwUThXGLrbeWDgFAe5rYJ3dXQeLKuq3Th0qSRadNi%2ftkZrEjoxxJB736v72yHWlNArwZQpQ71XDErksnNgL7vZuKuhn8WYZ0IVt17abbPAGGjRYZhBpDYuhKZijg5cyTdhH0ydKoxZylSUmQ5dPgEKL%2fGGqDdnD%2bWf5RRZLxgrMzfsHhsCSMf3dBQJQuzFK2vr5yFkuxvDrHoRzffG0aFuchSrC0qdf8HsZBTNCNQ1hAOApbfn5cnedOgADHjHp%2fph%2bEY%2f5nGpmjLVAvezgakTS22957MYDx8VcpJeugnm5pLop5OCGiNCtCIJsGfOHnep3oSWDY5K9srd8ooGpV38P9en%2bzBCrbRXpLYA7Kkschhbus3Vg441297U%2f2mdCWszCV2Tr1W18fNXo%2b3RvxLlDVFsT7FqaraAgN9%2b0XCWxl7tkMH4zkc6Pxt3H2gvVVXA1VIrsXQt4lcO8xVCYUAkMP3fUdgtpPZTs6mMc8rVLNdj6CqvmHspOZWwQGFu%2bB%2bRkvsp9qyw2DM3boZznvPFusfjsjrrMQYTb%2b3fQq%2bTIKNxkG%2fMxuRs3lEz%2bLcXRmmXP7LUT%2fm%2fuK%2feyJamdYx0FxXJwxjC6AL6sEHh6knlCNrta9Il1GMMPEy7Op0LeVXo73t88KFBPPp3M%2fplQIBZSPfTFZ1Ic0%2f60AV0J4aPsWruM2KZ9Osrp3FTBAPrnQfoosKBq0IQRIkoFnlvVaNbLOZrLMq5KJaqZEjGjyF7WkaIGx2CHanGDgFO1fA%2bj0lYCuwN7YWzlBB3aEU9HaMMCIEyfPBDqe7VH4B%2bxQkiv7njTEUWiSDRga40gnwQ0At7xAbnwrljLahd7d1TeIUFZmw4aXi6dqzVKMhf5eowYL29qur97dzJ%2fhuPtYxt1DXkQuHfPinH4VebKAei5W%2ftDXIMYxBASWmHuq%2bE3LEKiQT%2buygd%2f4Z9j6Lpbr3L7yHqEXtUNe0lZJHkZHiS%2fuyZuzRxtUyR8BXzzR7iEOCln2DgvxxdwY%2bRpMH4HNNHUcS%2bbZZHFSDV0QWZay%2brRBFf">
                        <input type="hidden" name="site2pstoretoken"
                               value="v1.2~370805C146117E1A86~F6F83165701CC36FA2001BE50403A4E775144941121173BCB52C83ADC71108C0DB800F12312331FBB3F3D6F3EDEF2314364BACFD312E0C8E1A53478CDBDC4A97F23FEB60A86E72B0DC417C953791571E09239E17CC9F1621F9816FAFEF7CA980C2C060A0F2D775FBE63D352EFE9FBE56D39D8E2366B15858251BF6930443211FE34839AE11702D7418C366689CA19DA6D92D00DCD0F9B420386A98CE6E06984B8201D631796573C24B1A095C60772721A99CC2373928D9ADB8ABCA4068474BCB3FB424C7094DA26FAE0FA35CDF3C2CC2CFF9AF8FE19B7D00C5B0AB9FDA906BC6BABBB73C432235D17714945E386978804D04D5CC893D5FCA">
                        <input type="hidden" name="locale" value="">
                        <li>
                            <div class="cb41w2">
                                <label for="sso_username"> 用户名
                                    <span class="hideFromScreen">
                                        <span id="readerunameerrormsg" class="error-show"></span>
                                        <span id="readerunamerequired" class="error-hide"> 错误：请输入您的用户名和密码</span>
                                    </span>
                                </label>
                                <input type="text" id="sso_username" name="ssousername" title=" 请输入用户名" maxlength="80"
                                       value="" tabindex="1"/>
                                <span class="cb41w5">
                                    <span class="cb41w6">
                                        <span role="tooltip" class="cb41noteshoverbtn" tabindex="4" title=" 用户名帮助">
                                            <span class="cb41notescontent"> 用户名通常是您的电子邮件地址。
                                                <%--<a href=" https://profile.oracle.com/myprofile/account/forgot-username.jspx"
                                                   tabindex="5" target="_blank"> 忘记用户名？</a>--%>
                                                <a href="#" tabindex="5" target="_blank"> 忘记用户名？</a>
                                            </span>
                                        </span>
                                    </span>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="cb41w3">
                                <label for="ssopassword"> 密码
                                    <span class="hideFromScreen">
                                        <span id="readerpwderrormsg" class="error-show"></span>
                                        <span id="readerpwdrequired" class="error-hide"> 错误：请输入您的用户名和密码</span>
                                    </span>
                                </label>
                                <input type="password" id="ssopassword" name="password" title=" 请输入密码" value=""
                                       maxlength="255" tabindex="2"/>
                                <span class="cb41w5">
                                    <span class="cb41w6">
                                        <span role="tooltip" class="cb41noteshoverbtn" tabindex="6" title=" 密码帮助">
                                            <span class="cb41notescontent">
                                                <%--<a href=" https://profile.oracle.com/myprofile/account/forgot-password.jspx" tabindex="7" target="_blank"> 忘记密码？</a>--%>
                                                <a href="#" tabindex="7" target="_blank"> 忘记密码？</a>
                                            </span>
                                        </span>
                                    </span>
                                </span>
                            </div>
                        </li>
                    </ul>
                    <div class="cb41w7">
                        <span id="required" class="error-hide">
                            <div class="cb41error">请输入您的用户名和密码</div>
                        </span>
                    </div>
                    <div class="cb41w4">
                        <span>
                            <input type="button" value=" 登录" tabindex="3" title=" 请单击此处登录" onclick="doLogin(document.LoginForm);"/>
                        </span>
                    </div>
                </form>
            </div>
            <div class="cb41w1">
                <h3> 没有 Pentaho 帐户？</h3>
                <div class="cb41w4">
                    <span>
                        <a href="#" class="cb41create-btn" tabindex="8"> 创建帐户</a>
                    </span>
                </div>
                <div class="cb41w8">
                    <!-- U17v0 -->
                    <div id="u17" class="u17 u17v0">
                        <div class="u17w1 cwidth">
                            <ul>
                                <li>&copy; Pentaho</li>
                                <li><a href="#" target="_blank"> 使用条款</a></li>
                                <li><a href="#" target="_blank"> 隐私政策</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- /U17v0 -->
                </div>
                <!-- /CB41w8 -->
            </div>
            <!-- /CB41w1 -->
        </div>
        <!-- /CB41v0 -->
        <script type="text/javascript" src="views/jquery.js"></script>
        <script type="text/javascript" src="views/sso.js"></script>
    </div>
</body>
</html>
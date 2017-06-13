<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title> -->
    <title>天行VPN官网</title>
    {include file="$template/includes/head.tpl"}

    {$headoutput}

</head>
<body>

  <!--div class="alert alert-warning alert-top-warning">
    由于盗版及侵权行为猖獗，2017年1月13日起 天行VPN 一代相关软件停止研发，主推 天行VPN<sup>pro</sup>，老用户将在客户中心自动升级，新用户请记住我们的品牌，<a href="" target="_blank">点此查看天行VPN声明</a>
  </div-->
  <header>
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar-collapse" aria-expanded="false">
                <span class="sr-only">显示导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href=""><img src="{$WEB_ROOT}/templates/{$template}/images/logo.png" alt="天行VPN"></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="header-navbar-collapse">
          <ul class="nav navbar-nav">
              <li class="active"><a href="/">首页</a></li>
              <li><a href="">价格体系</a></li>
              <li><a rel="nofollow" href="">购买服务</a></li>
              <li><a rel="nofollow" href="">联系我们</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right nav-links">
            {if $languagechangeenabled && count($locales) > 1}
              <li>
                <a href="#" class="quick-nav" data-toggle="popover" id="languageChooser"><i class="fa fa-language"></i> {$LANG.chooselanguage} <span class="caret"></span></a>
                <div id="languageChooserContent" class="hidden">
                    <ul>
                        {foreach from=$locales item=locale}
                            <li><a href="{$currentpagelinkback}language={$locale.language}">{$locale.localisedName}</a></li>
                        {/foreach}
                    </ul>
                </div>
              </li>
            {/if}
            <!-- Login/Account Notifications -->
            {if $loggedin}
              <li>
                <a href="#" class="quick-nav" data-toggle="popover" id="accountNotifications" data-placement="bottom" title="{lang key="notifications"}"><i class="fa fa-info"></i> {$LANG.notifications} ({$clientAlerts|count})</a>
                <div id="accountNotificationsContent" class="hidden">
                    {foreach $clientAlerts as $alert}
                        <div class="clientalert text-{$alert->getSeverity()}">{$alert->getMessage()}{if $alert->getLinkText()} <a href="{$alert->getLink()}" class="btn btn-xs btn-{$alert->getSeverity()}">{$alert->getLinkText()}</a>{/if}</div>
                    {foreachelse}
                        <div class="clientalert text-success"><i class="fa fa-check-square-o"></i> {$LANG.notificationsnone}</div>
                    {/foreach}
                </div>
              </li>
            {else}
              <li>
                <a href="#" class="quick-nav" data-toggle="popover" id="loginOrRegister" data-placement="bottom"><i class="fa fa-user"></i> {$LANG.login}</a>
                <div id="loginOrRegisterContent" class="hidden">
                    <form class="login-form" action="{if $systemsslurl}{$systemsslurl}{else}{$systemurl}{/if}dologin.php" method="post" role="form">
                        <div class="form-group">
                            <input type="email" name="username" class="form-control" placeholder="{$LANG.clientareaemail}" required />
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <input type="password" name="password" class="form-control" placeholder="{$LANG.loginpassword}" autocomplete="off" required />
                                <span class="input-group-btn">
                                    <input type="submit" class="btn btn-primary" value="{$LANG.login}" />
                                </span>
                            </div>
                        </div>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="rememberme" /> {$LANG.loginrememberme} &bull; <a href="{$WEB_ROOT}/pwreset.php">{$LANG.forgotpw}</a>
                        </label>
                    </form>
                    {if $condlinks.allowClientRegistration}
                        <hr />
                        {$LANG.newcustomersignup|sprintf2:"<a href=\"$WEB_ROOT/register.php\">":"</a>"}
                    {/if}
                </div>
              </li>
            {/if}
            {if $adminMasqueradingAsClient}
              <li>
                <!-- Return to admin link -->
                <div class="alert alert-danger admin-masquerade-notice">
                    {$LANG.adminmasqueradingasclient}<br />
                    <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="alert-link">{$LANG.logoutandreturntoadminarea}</a>
                </div>
              </li>
            {elseif $adminLoggedIn}
              <li>
                <!-- Return to admin link -->
                <div class="alert alert-danger admin-masquerade-notice">
                    {$LANG.adminloggedin}<br />
                    <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="alert-link">{$LANG.returntoadminarea}</a>
                </div>
              </li>
            {/if}
            {if $loggedin}
            <li>
              {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar}
              <!-- 用户 end -->
            </li>
            {/if}
            <li>
              <!-- Shopping Cart -->
              <a href="{$WEB_ROOT}/cart.php?a=view" class="quick-nav"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs">{$LANG.viewcart} (</span><span id="cartItemCount">{$cartitemcount}</span><span class="hidden-xs">)</span></a>
            </li>
          </ul>
        </div>
        <!-- /.navbar-collapse -->
      </div>
      <!-- /.container-fluid -->
    </nav>
  </header>

{$headeroutput}

{if $templatefile neq 'homepage'}
<section id="main-menu">

    <nav id="nav" class="navbar navbar-default navbar-main" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
              </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    </nav>

</section>
{/if}

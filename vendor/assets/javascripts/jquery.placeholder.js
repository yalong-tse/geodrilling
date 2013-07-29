


<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>jquery-placeholder/jquery.placeholder.js at master · mathiasbynens/jquery-placeholder</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <link rel="logo" type="image/svg" href="https://github-media-downloads.s3.amazonaws.com/github-logo.svg" />
    <meta property="og:image" content="https://github.global.ssl.fastly.net/images/modules/logos_page/Octocat.png">
    <meta name="hostname" content="fe4.rs.github.com">
    <link rel="assets" href="https://github.global.ssl.fastly.net/">
    <link rel="xhr-socket" href="/_sockets" />
    
    


    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" /><meta content="3189766" name="octolytics-actor-id" /><meta content="nhr407" name="octolytics-actor-login" /><meta content="21c7f818cee5365d6ccdb7a7a0eb3cd83807bf24b94aea60e84f77ed55b26072" name="octolytics-actor-hash" />

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="nH2asWV6GnA0fAnmA03P5GN/RuABmdlyLqpxSGjSisQ=" name="csrf-token" />

    <link href="https://github.global.ssl.fastly.net/assets/github-f913aa6cea9c2be873a594b06df4bdd56c61a47a.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://github.global.ssl.fastly.net/assets/github2-73cb9c180ee487edb3f37f7f9b1cbf7bd6ebe204.css" media="all" rel="stylesheet" type="text/css" />
    


      <script src="https://github.global.ssl.fastly.net/assets/frameworks-e8054ad804a1cf9e9849130fee5a4a5487b663ed.js" type="text/javascript"></script>
      <script src="https://github.global.ssl.fastly.net/assets/github-97664a532fc6064b297cd0484a0b7bfda19f46b4.js" type="text/javascript"></script>
      
      <meta http-equiv="x-pjax-version" content="6eeba794374d861b396b25d9719604b1">

        <link data-pjax-transient rel='permalink' href='/mathiasbynens/jquery-placeholder/blob/b7f508e207b5b934a2cd153aecaf8dab09b9857e/jquery.placeholder.js'>
  <meta property="og:title" content="jquery-placeholder"/>
  <meta property="og:type" content="githubog:gitrepository"/>
  <meta property="og:url" content="https://github.com/mathiasbynens/jquery-placeholder"/>
  <meta property="og:image" content="https://github.global.ssl.fastly.net/images/gravatars/gravatar-user-420.png"/>
  <meta property="og:site_name" content="GitHub"/>
  <meta property="og:description" content="jquery-placeholder - A jQuery plugin that enables HTML5 placeholder behavior for browsers that aren’t trying hard enough yet"/>

  <meta name="description" content="jquery-placeholder - A jQuery plugin that enables HTML5 placeholder behavior for browsers that aren’t trying hard enough yet" />

  <meta content="81942" name="octolytics-dimension-user_id" /><meta content="mathiasbynens" name="octolytics-dimension-user_login" /><meta content="479586" name="octolytics-dimension-repository_id" /><meta content="mathiasbynens/jquery-placeholder" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="479586" name="octolytics-dimension-repository_network_root_id" /><meta content="mathiasbynens/jquery-placeholder" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/mathiasbynens/jquery-placeholder/commits/master.atom" rel="alternate" title="Recent Commits to jquery-placeholder:master" type="application/atom+xml" />

  </head>


  <body class="logged_in page-blob linux vis-public env-production ">

    <div class="wrapper">
      
      
      


      <div class="header header-logged-in true">
  <div class="container clearfix">

    <a class="header-logo-invertocat" href="https://github.com/">
  <span class="mega-octicon octicon-mark-github"></span>
</a>

    <div class="divider-vertical"></div>

      <a href="/notifications" class="notification-indicator tooltipped downwards" title="You have no unread notifications">
    <span class="mail-status all-read"></span>
  </a>
  <div class="divider-vertical"></div>


      <div class="command-bar js-command-bar  in-repository">
          <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">

<input type="text" data-hotkey="/ s" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
    data-username="nhr407"
      data-repo="mathiasbynens/jquery-placeholder"
      data-branch="master"
      data-sha="5535598980c0706a39880b7ba9604f746d7b6437"
  >

    <input type="hidden" name="nwo" value="mathiasbynens/jquery-placeholder" />

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item js-this-repository-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked" />
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item js-all-repositories-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global" />
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="octicon help tooltipped downwards" title="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

</form>
        <ul class="top-nav">
            <li class="explore"><a href="/explore">Explore</a></li>
            <li><a href="https://gist.github.com">Gist</a></li>
            <li><a href="/blog">Blog</a></li>
          <li><a href="https://help.github.com">Help</a></li>
        </ul>
      </div>

    

  

    <ul id="user-links">
      <li>
        <a href="/nhr407" class="name">
          <img height="20" src="https://secure.gravatar.com/avatar/ba0c902b7e981c6361bfc61e3f701828?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /> nhr407
        </a>
      </li>

        <li>
          <a href="/new" id="new_repo" class="tooltipped downwards" title="Create a new repo" aria-label="Create a new repo">
            <span class="octicon octicon-repo-create"></span>
          </a>
        </li>

        <li>
          <a href="/settings/profile" id="account_settings"
            class="tooltipped downwards"
            aria-label="Account settings "
            title="Account settings ">
            <span class="octicon octicon-tools"></span>
          </a>
        </li>
        <li>
          <a class="tooltipped downwards" href="/logout" data-method="post" id="logout" title="Sign out" aria-label="Sign out">
            <span class="octicon octicon-log-out"></span>
          </a>
        </li>

    </ul>


<div class="js-new-dropdown-contents hidden">
  

<ul class="dropdown-menu">
  <li>
    <a href="/new"><span class="octicon octicon-repo-create"></span> New repository</a>
  </li>
  <li>
    <a href="/organizations/new"><span class="octicon octicon-organization"></span> New organization</a>
  </li>



    <li class="section-title">
      <span title="mathiasbynens/jquery-placeholder">This repository</span>
    </li>
    <li>
      <a href="/mathiasbynens/jquery-placeholder/issues/new"><span class="octicon octicon-issue-opened"></span> New issue</a>
    </li>
</ul>

</div>


    
  </div>
</div>

      

      




          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        

<ul class="pagehead-actions">

    <li class="subscription">
      <form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="authenticity_token" type="hidden" value="nH2asWV6GnA0fAnmA03P5GN/RuABmdlyLqpxSGjSisQ=" /></div>  <input id="repository_id" name="repository_id" type="hidden" value="479586" />

    <div class="select-menu js-menu-container js-select-menu">
        <a class="social-count js-social-count" href="/mathiasbynens/jquery-placeholder/watchers">
          102
        </a>
      <span class="minibutton select-menu-button with-count js-menu-target">
        <span class="js-select-button">
          <span class="octicon octicon-eye-watch"></span>
          Watch
        </span>
      </span>

      <div class="select-menu-modal-holder">
        <div class="select-menu-modal subscription-menu-modal js-menu-content">
          <div class="select-menu-header">
            <span class="select-menu-title">Notification status</span>
            <span class="octicon octicon-remove-close js-menu-close"></span>
          </div> <!-- /.select-menu-header -->

          <div class="select-menu-list js-navigation-container">

            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input checked="checked" id="do_included" name="do" type="radio" value="included" />
                <h4>Not watching</h4>
                <span class="description">You only receive notifications for discussions in which you participate or are @mentioned.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye-watch"></span>
                  Watch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_subscribed" name="do" type="radio" value="subscribed" />
                <h4>Watching</h4>
                <span class="description">You receive notifications for all discussions in this repository.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye-unwatch"></span>
                  Unwatch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_ignore" name="do" type="radio" value="ignore" />
                <h4>Ignoring</h4>
                <span class="description">You do not receive any notifications for discussions in this repository.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-mute"></span>
                  Stop ignoring
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

          </div> <!-- /.select-menu-list -->

        </div> <!-- /.select-menu-modal -->
      </div> <!-- /.select-menu-modal-holder -->
    </div> <!-- /.select-menu -->

</form>
    </li>

  <li>
  
<div class="js-toggler-container js-social-container starring-container on">
  <a href="/mathiasbynens/jquery-placeholder/unstar" class="minibutton with-count js-toggler-target star-button starred upwards" title="Unstar this repo" data-remote="true" data-method="post" rel="nofollow">
    <span class="octicon octicon-star-delete"></span><span class="text">Unstar</span>
  </a>
  <a href="/mathiasbynens/jquery-placeholder/star" class="minibutton with-count js-toggler-target star-button unstarred upwards " title="Star this repo" data-remote="true" data-method="post" rel="nofollow">
    <span class="octicon octicon-star"></span><span class="text">Star</span>
  </a>
  <a class="social-count js-social-count" href="/mathiasbynens/jquery-placeholder/stargazers">1,935</a>
</div>

  </li>


        <li>
          <a href="/mathiasbynens/jquery-placeholder/fork" class="minibutton with-count js-toggler-target fork-button lighter upwards" title="Fork this repo" rel="nofollow" data-method="post">
            <span class="octicon octicon-git-branch-create"></span><span class="text">Fork</span>
          </a>
          <a href="/mathiasbynens/jquery-placeholder/network" class="social-count">697</a>
        </li>


</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="repo-label"><span>public</span></span>
          <span class="mega-octicon octicon-repo"></span>
          <span class="author">
            <a href="/mathiasbynens" class="url fn" itemprop="url" rel="author"><span itemprop="title">mathiasbynens</span></a></span
          ><span class="repohead-name-divider">/</span><strong
          ><a href="/mathiasbynens/jquery-placeholder" class="js-current-repository js-repo-home-link">jquery-placeholder</a></strong>

          <span class="page-context-loader">
            <img alt="Octocat-spinner-32" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">

      <div class="repository-with-sidebar repo-container ">

        <div class="repository-sidebar">
            

<div class="repo-nav repo-nav-full js-repository-container-pjax js-octicon-loaders">
  <div class="repo-nav-contents">
    <ul class="repo-menu">
      <li class="tooltipped leftwards" title="Code">
        <a href="/mathiasbynens/jquery-placeholder" aria-label="Code" class="js-selected-navigation-item selected" data-gotokey="c" data-pjax="true" data-selected-links="repo_source repo_downloads repo_commits repo_tags repo_branches /mathiasbynens/jquery-placeholder">
          <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

        <li class="tooltipped leftwards" title="Issues">
          <a href="/mathiasbynens/jquery-placeholder/issues" aria-label="Issues" class="js-selected-navigation-item js-disable-pjax" data-gotokey="i" data-selected-links="repo_issues /mathiasbynens/jquery-placeholder/issues">
            <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
            <span class='counter'>62</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>

      <li class="tooltipped leftwards" title="Pull Requests"><a href="/mathiasbynens/jquery-placeholder/pulls" aria-label="Pull Requests" class="js-selected-navigation-item js-disable-pjax" data-gotokey="p" data-selected-links="repo_pulls /mathiasbynens/jquery-placeholder/pulls">
            <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
            <span class='counter'>20</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>


    </ul>
    <div class="repo-menu-separator"></div>
    <ul class="repo-menu">

      <li class="tooltipped leftwards" title="Pulse">
        <a href="/mathiasbynens/jquery-placeholder/pulse" aria-label="Pulse" class="js-selected-navigation-item " data-pjax="true" data-selected-links="pulse /mathiasbynens/jquery-placeholder/pulse">
          <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Graphs">
        <a href="/mathiasbynens/jquery-placeholder/graphs" aria-label="Graphs" class="js-selected-navigation-item " data-pjax="true" data-selected-links="repo_graphs repo_contributors /mathiasbynens/jquery-placeholder/graphs">
          <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Network">
        <a href="/mathiasbynens/jquery-placeholder/network" aria-label="Network" class="js-selected-navigation-item js-disable-pjax" data-selected-links="repo_network /mathiasbynens/jquery-placeholder/network">
          <span class="octicon octicon-git-branch"></span> <span class="full-word">Network</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

    </ul>

  </div>
</div>

            <div class="only-with-full-nav">
              

  

<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><strong>HTTPS</strong> clone URL</h3>

  <input type="text" class="clone js-url-field"
         value="https://github.com/mathiasbynens/jquery-placeholder.git" readonly="readonly">

  <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/mathiasbynens/jquery-placeholder.git" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
</div>

  

<div class="clone-url "
  data-protocol-type="ssh"
  data-url="/users/set_protocol?protocol_selector=ssh&amp;protocol_type=clone">
  <h3><strong>SSH</strong> clone URL</h3>

  <input type="text" class="clone js-url-field"
         value="git@github.com:mathiasbynens/jquery-placeholder.git" readonly="readonly">

  <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="git@github.com:mathiasbynens/jquery-placeholder.git" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
</div>

  

<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><strong>Subversion</strong> checkout URL</h3>

  <input type="text" class="clone js-url-field"
         value="https://github.com/mathiasbynens/jquery-placeholder" readonly="readonly">

  <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/mathiasbynens/jquery-placeholder" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
</div>



<p class="clone-options">You can clone with
    <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>,
    <a href="#" class="js-clone-selector" data-protocol="ssh">SSH</a>,
    <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>,
  and <a href="https://help.github.com/articles/which-remote-url-should-i-use">other methods.</a>
</p>



                <a href="/mathiasbynens/jquery-placeholder/archive/master.zip"
                   class="minibutton sidebar-button"
                   title="Download this repository as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
            </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          


<!-- blob contrib key: blob_contributors:v21:5869138757ce4dfdddc8b643581310b6 -->
<!-- blob contrib frag key: views10/v8/blob_contributors:v21:5869138757ce4dfdddc8b643581310b6 -->

<p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

<a href="/mathiasbynens/jquery-placeholder/find/master" data-pjax data-hotkey="t" style="display:none">Show File Finder</a>

<div class="file-navigation">
  


<div class="select-menu js-menu-container js-select-menu" >
  <span class="minibutton select-menu-button js-menu-target" data-hotkey="w"
    data-master-branch="master"
    data-ref="master">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax>

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-remove-close js-menu-close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/master/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="master" data-skip-pjax="true" rel="nofollow" title="master">master</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/v2.0.7/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v2.0.7" data-skip-pjax="true" rel="nofollow" title="v2.0.7">v2.0.7</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/v2.0.6/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v2.0.6" data-skip-pjax="true" rel="nofollow" title="v2.0.6">v2.0.6</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/v2.0.5/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v2.0.5" data-skip-pjax="true" rel="nofollow" title="v2.0.5">v2.0.5</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/v2.0.4/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v2.0.4" data-skip-pjax="true" rel="nofollow" title="v2.0.4">v2.0.4</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/v2.0.3/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v2.0.3" data-skip-pjax="true" rel="nofollow" title="v2.0.3">v2.0.3</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/v2.0.2/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v2.0.2" data-skip-pjax="true" rel="nofollow" title="v2.0.2">v2.0.2</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/v2.0.1/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v2.0.1" data-skip-pjax="true" rel="nofollow" title="v2.0.1">v2.0.1</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/v2.0.0/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v2.0.0" data-skip-pjax="true" rel="nofollow" title="v2.0.0">v2.0.0</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/v1.8.7/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.8.7" data-skip-pjax="true" rel="nofollow" title="v1.8.7">v1.8.7</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/v1.8.6/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.8.6" data-skip-pjax="true" rel="nofollow" title="v1.8.6">v1.8.6</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/v1.8.5/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.8.5" data-skip-pjax="true" rel="nofollow" title="v1.8.5">v1.8.5</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/v1.8.4/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.8.4" data-skip-pjax="true" rel="nofollow" title="v1.8.4">v1.8.4</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/v1.8.3/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.8.3" data-skip-pjax="true" rel="nofollow" title="v1.8.3">v1.8.3</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/mathiasbynens/jquery-placeholder/blob/v1.8.2/jquery.placeholder.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.8.2" data-skip-pjax="true" rel="nofollow" title="v1.8.2">v1.8.2</a>
            </div> <!-- /.select-menu-item -->
        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="breadcrumb">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/mathiasbynens/jquery-placeholder" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">jquery-placeholder</span></a></span></span><span class="separator"> / </span><strong class="final-path">jquery.placeholder.js</strong> <span class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="jquery.placeholder.js" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


  
  <div class="commit file-history-tease">
    <img class="main-avatar" height="24" src="https://secure.gravatar.com/avatar/bc4e82e924e728586395b97a47bb0945?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
    <span class="author"><a href="/dsgh" rel="author">dsgh</a></span>
    <time class="js-relative-date" datetime="2012-04-27T06:54:08-07:00" title="2012-04-27 06:54:08">April 27, 2012</time>
    <div class="commit-title">
        <a href="/mathiasbynens/jquery-placeholder/commit/c9fe9f2c0f841166d0e3e78df191f4a6daa7aa30" class="message">Use ascii single quote as apostrophe instead of unicode's right singl…</a>
    </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>3</strong> contributors</a></p>
          <a class="avatar tooltipped downwards" title="mathiasbynens" href="/mathiasbynens/jquery-placeholder/commits/master/jquery.placeholder.js?author=mathiasbynens"><img height="20" src="https://secure.gravatar.com/avatar/24e08a9ea84deb17ae121074d0f17125?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>
    <a class="avatar tooltipped downwards" title="temp01" href="/mathiasbynens/jquery-placeholder/commits/master/jquery.placeholder.js?author=temp01"><img height="20" src="https://secure.gravatar.com/avatar/b686e79e88ab2e6fa63be0070da7bb71?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>
    <a class="avatar tooltipped downwards" title="dsgh" href="/mathiasbynens/jquery-placeholder/commits/master/jquery.placeholder.js?author=dsgh"><img height="20" src="https://secure.gravatar.com/avatar/bc4e82e924e728586395b97a47bb0945?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>


    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2>Users on GitHub who have contributed to this file</h2>
      <ul class="facebox-user-list">
        <li>
          <img height="24" src="https://secure.gravatar.com/avatar/24e08a9ea84deb17ae121074d0f17125?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/mathiasbynens">mathiasbynens</a>
        </li>
        <li>
          <img height="24" src="https://secure.gravatar.com/avatar/b686e79e88ab2e6fa63be0070da7bb71?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/temp01">temp01</a>
        </li>
        <li>
          <img height="24" src="https://secure.gravatar.com/avatar/bc4e82e924e728586395b97a47bb0945?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/dsgh">dsgh</a>
        </li>
      </ul>
    </div>
  </div>


<div id="files" class="bubble">
  <div class="file">
    <div class="meta">
      <div class="info">
        <span class="icon"><b class="octicon octicon-file-text"></b></span>
        <span class="mode" title="File Mode">file</span>
          <span>157 lines (141 sloc)</span>
        <span>4.515 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
                <a class="minibutton tooltipped leftwards"
                   title="Clicking this button will automatically fork this project so you can edit the file"
                   href="/mathiasbynens/jquery-placeholder/edit/master/jquery.placeholder.js"
                   data-method="post" rel="nofollow">Edit</a>
          <a href="/mathiasbynens/jquery-placeholder/raw/master/jquery.placeholder.js" class="button minibutton " id="raw-url">Raw</a>
            <a href="/mathiasbynens/jquery-placeholder/blame/master/jquery.placeholder.js" class="button minibutton ">Blame</a>
          <a href="/mathiasbynens/jquery-placeholder/commits/master/jquery.placeholder.js" class="button minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->
            <a class="minibutton danger empty-icon tooltipped downwards"
               href="/mathiasbynens/jquery-placeholder/delete/master/jquery.placeholder.js"
               title="Fork this project and delete file" data-method="post" rel="nofollow">
            Delete
          </a>
      </div><!-- /.actions -->

    </div>
        <div class="blob-wrapper data type-javascript js-blob-data">
      <table class="file-code file-diff">
        <tr class="file-code-line">
          <td class="blob-line-nums">
            <span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>
<span id="L79" rel="#L79">79</span>
<span id="L80" rel="#L80">80</span>
<span id="L81" rel="#L81">81</span>
<span id="L82" rel="#L82">82</span>
<span id="L83" rel="#L83">83</span>
<span id="L84" rel="#L84">84</span>
<span id="L85" rel="#L85">85</span>
<span id="L86" rel="#L86">86</span>
<span id="L87" rel="#L87">87</span>
<span id="L88" rel="#L88">88</span>
<span id="L89" rel="#L89">89</span>
<span id="L90" rel="#L90">90</span>
<span id="L91" rel="#L91">91</span>
<span id="L92" rel="#L92">92</span>
<span id="L93" rel="#L93">93</span>
<span id="L94" rel="#L94">94</span>
<span id="L95" rel="#L95">95</span>
<span id="L96" rel="#L96">96</span>
<span id="L97" rel="#L97">97</span>
<span id="L98" rel="#L98">98</span>
<span id="L99" rel="#L99">99</span>
<span id="L100" rel="#L100">100</span>
<span id="L101" rel="#L101">101</span>
<span id="L102" rel="#L102">102</span>
<span id="L103" rel="#L103">103</span>
<span id="L104" rel="#L104">104</span>
<span id="L105" rel="#L105">105</span>
<span id="L106" rel="#L106">106</span>
<span id="L107" rel="#L107">107</span>
<span id="L108" rel="#L108">108</span>
<span id="L109" rel="#L109">109</span>
<span id="L110" rel="#L110">110</span>
<span id="L111" rel="#L111">111</span>
<span id="L112" rel="#L112">112</span>
<span id="L113" rel="#L113">113</span>
<span id="L114" rel="#L114">114</span>
<span id="L115" rel="#L115">115</span>
<span id="L116" rel="#L116">116</span>
<span id="L117" rel="#L117">117</span>
<span id="L118" rel="#L118">118</span>
<span id="L119" rel="#L119">119</span>
<span id="L120" rel="#L120">120</span>
<span id="L121" rel="#L121">121</span>
<span id="L122" rel="#L122">122</span>
<span id="L123" rel="#L123">123</span>
<span id="L124" rel="#L124">124</span>
<span id="L125" rel="#L125">125</span>
<span id="L126" rel="#L126">126</span>
<span id="L127" rel="#L127">127</span>
<span id="L128" rel="#L128">128</span>
<span id="L129" rel="#L129">129</span>
<span id="L130" rel="#L130">130</span>
<span id="L131" rel="#L131">131</span>
<span id="L132" rel="#L132">132</span>
<span id="L133" rel="#L133">133</span>
<span id="L134" rel="#L134">134</span>
<span id="L135" rel="#L135">135</span>
<span id="L136" rel="#L136">136</span>
<span id="L137" rel="#L137">137</span>
<span id="L138" rel="#L138">138</span>
<span id="L139" rel="#L139">139</span>
<span id="L140" rel="#L140">140</span>
<span id="L141" rel="#L141">141</span>
<span id="L142" rel="#L142">142</span>
<span id="L143" rel="#L143">143</span>
<span id="L144" rel="#L144">144</span>
<span id="L145" rel="#L145">145</span>
<span id="L146" rel="#L146">146</span>
<span id="L147" rel="#L147">147</span>
<span id="L148" rel="#L148">148</span>
<span id="L149" rel="#L149">149</span>
<span id="L150" rel="#L150">150</span>
<span id="L151" rel="#L151">151</span>
<span id="L152" rel="#L152">152</span>
<span id="L153" rel="#L153">153</span>
<span id="L154" rel="#L154">154</span>
<span id="L155" rel="#L155">155</span>
<span id="L156" rel="#L156">156</span>
<span id="L157" rel="#L157">157</span>

          </td>
          <td class="blob-line-code">
                  <div class="highlight"><pre><div class='line' id='LC1'><span class="cm">/*! http://mths.be/placeholder v2.0.7 by @mathias */</span></div><div class='line' id='LC2'><span class="p">;(</span><span class="kd">function</span><span class="p">(</span><span class="nb">window</span><span class="p">,</span> <span class="nb">document</span><span class="p">,</span> <span class="nx">$</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC3'><br/></div><div class='line' id='LC4'>	<span class="kd">var</span> <span class="nx">isInputSupported</span> <span class="o">=</span> <span class="s1">&#39;placeholder&#39;</span> <span class="k">in</span> <span class="nb">document</span><span class="p">.</span><span class="nx">createElement</span><span class="p">(</span><span class="s1">&#39;input&#39;</span><span class="p">),</span></div><div class='line' id='LC5'>	    <span class="nx">isTextareaSupported</span> <span class="o">=</span> <span class="s1">&#39;placeholder&#39;</span> <span class="k">in</span> <span class="nb">document</span><span class="p">.</span><span class="nx">createElement</span><span class="p">(</span><span class="s1">&#39;textarea&#39;</span><span class="p">),</span></div><div class='line' id='LC6'>	    <span class="nx">prototype</span> <span class="o">=</span> <span class="nx">$</span><span class="p">.</span><span class="nx">fn</span><span class="p">,</span></div><div class='line' id='LC7'>	    <span class="nx">valHooks</span> <span class="o">=</span> <span class="nx">$</span><span class="p">.</span><span class="nx">valHooks</span><span class="p">,</span></div><div class='line' id='LC8'>	    <span class="nx">hooks</span><span class="p">,</span></div><div class='line' id='LC9'>	    <span class="nx">placeholder</span><span class="p">;</span></div><div class='line' id='LC10'><br/></div><div class='line' id='LC11'>	<span class="k">if</span> <span class="p">(</span><span class="nx">isInputSupported</span> <span class="o">&amp;&amp;</span> <span class="nx">isTextareaSupported</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC12'><br/></div><div class='line' id='LC13'>		<span class="nx">placeholder</span> <span class="o">=</span> <span class="nx">prototype</span><span class="p">.</span><span class="nx">placeholder</span> <span class="o">=</span> <span class="kd">function</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC14'>			<span class="k">return</span> <span class="k">this</span><span class="p">;</span></div><div class='line' id='LC15'>		<span class="p">};</span></div><div class='line' id='LC16'><br/></div><div class='line' id='LC17'>		<span class="nx">placeholder</span><span class="p">.</span><span class="nx">input</span> <span class="o">=</span> <span class="nx">placeholder</span><span class="p">.</span><span class="nx">textarea</span> <span class="o">=</span> <span class="kc">true</span><span class="p">;</span></div><div class='line' id='LC18'><br/></div><div class='line' id='LC19'>	<span class="p">}</span> <span class="k">else</span> <span class="p">{</span></div><div class='line' id='LC20'><br/></div><div class='line' id='LC21'>		<span class="nx">placeholder</span> <span class="o">=</span> <span class="nx">prototype</span><span class="p">.</span><span class="nx">placeholder</span> <span class="o">=</span> <span class="kd">function</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC22'>			<span class="kd">var</span> <span class="nx">$this</span> <span class="o">=</span> <span class="k">this</span><span class="p">;</span></div><div class='line' id='LC23'>			<span class="nx">$this</span></div><div class='line' id='LC24'>				<span class="p">.</span><span class="nx">filter</span><span class="p">((</span><span class="nx">isInputSupported</span> <span class="o">?</span> <span class="s1">&#39;textarea&#39;</span> <span class="o">:</span> <span class="s1">&#39;:input&#39;</span><span class="p">)</span> <span class="o">+</span> <span class="s1">&#39;[placeholder]&#39;</span><span class="p">)</span></div><div class='line' id='LC25'>				<span class="p">.</span><span class="nx">not</span><span class="p">(</span><span class="s1">&#39;.placeholder&#39;</span><span class="p">)</span></div><div class='line' id='LC26'>				<span class="p">.</span><span class="nx">bind</span><span class="p">({</span></div><div class='line' id='LC27'>					<span class="s1">&#39;focus.placeholder&#39;</span><span class="o">:</span> <span class="nx">clearPlaceholder</span><span class="p">,</span></div><div class='line' id='LC28'>					<span class="s1">&#39;blur.placeholder&#39;</span><span class="o">:</span> <span class="nx">setPlaceholder</span></div><div class='line' id='LC29'>				<span class="p">})</span></div><div class='line' id='LC30'>				<span class="p">.</span><span class="nx">data</span><span class="p">(</span><span class="s1">&#39;placeholder-enabled&#39;</span><span class="p">,</span> <span class="kc">true</span><span class="p">)</span></div><div class='line' id='LC31'>				<span class="p">.</span><span class="nx">trigger</span><span class="p">(</span><span class="s1">&#39;blur.placeholder&#39;</span><span class="p">);</span></div><div class='line' id='LC32'>			<span class="k">return</span> <span class="nx">$this</span><span class="p">;</span></div><div class='line' id='LC33'>		<span class="p">};</span></div><div class='line' id='LC34'><br/></div><div class='line' id='LC35'>		<span class="nx">placeholder</span><span class="p">.</span><span class="nx">input</span> <span class="o">=</span> <span class="nx">isInputSupported</span><span class="p">;</span></div><div class='line' id='LC36'>		<span class="nx">placeholder</span><span class="p">.</span><span class="nx">textarea</span> <span class="o">=</span> <span class="nx">isTextareaSupported</span><span class="p">;</span></div><div class='line' id='LC37'><br/></div><div class='line' id='LC38'>		<span class="nx">hooks</span> <span class="o">=</span> <span class="p">{</span></div><div class='line' id='LC39'>			<span class="s1">&#39;get&#39;</span><span class="o">:</span> <span class="kd">function</span><span class="p">(</span><span class="nx">element</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC40'>				<span class="kd">var</span> <span class="nx">$element</span> <span class="o">=</span> <span class="nx">$</span><span class="p">(</span><span class="nx">element</span><span class="p">);</span></div><div class='line' id='LC41'>				<span class="k">return</span> <span class="nx">$element</span><span class="p">.</span><span class="nx">data</span><span class="p">(</span><span class="s1">&#39;placeholder-enabled&#39;</span><span class="p">)</span> <span class="o">&amp;&amp;</span> <span class="nx">$element</span><span class="p">.</span><span class="nx">hasClass</span><span class="p">(</span><span class="s1">&#39;placeholder&#39;</span><span class="p">)</span> <span class="o">?</span> <span class="s1">&#39;&#39;</span> <span class="o">:</span> <span class="nx">element</span><span class="p">.</span><span class="nx">value</span><span class="p">;</span></div><div class='line' id='LC42'>			<span class="p">},</span></div><div class='line' id='LC43'>			<span class="s1">&#39;set&#39;</span><span class="o">:</span> <span class="kd">function</span><span class="p">(</span><span class="nx">element</span><span class="p">,</span> <span class="nx">value</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC44'>				<span class="kd">var</span> <span class="nx">$element</span> <span class="o">=</span> <span class="nx">$</span><span class="p">(</span><span class="nx">element</span><span class="p">);</span></div><div class='line' id='LC45'>				<span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="nx">$element</span><span class="p">.</span><span class="nx">data</span><span class="p">(</span><span class="s1">&#39;placeholder-enabled&#39;</span><span class="p">))</span> <span class="p">{</span></div><div class='line' id='LC46'>					<span class="k">return</span> <span class="nx">element</span><span class="p">.</span><span class="nx">value</span> <span class="o">=</span> <span class="nx">value</span><span class="p">;</span></div><div class='line' id='LC47'>				<span class="p">}</span></div><div class='line' id='LC48'>				<span class="k">if</span> <span class="p">(</span><span class="nx">value</span> <span class="o">==</span> <span class="s1">&#39;&#39;</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC49'>					<span class="nx">element</span><span class="p">.</span><span class="nx">value</span> <span class="o">=</span> <span class="nx">value</span><span class="p">;</span></div><div class='line' id='LC50'>					<span class="c1">// Issue #56: Setting the placeholder causes problems if the element continues to have focus.</span></div><div class='line' id='LC51'>					<span class="k">if</span> <span class="p">(</span><span class="nx">element</span> <span class="o">!=</span> <span class="nb">document</span><span class="p">.</span><span class="nx">activeElement</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC52'>						<span class="c1">// We can&#39;t use `triggerHandler` here because of dummy text/password inputs :(</span></div><div class='line' id='LC53'>						<span class="nx">setPlaceholder</span><span class="p">.</span><span class="nx">call</span><span class="p">(</span><span class="nx">element</span><span class="p">);</span></div><div class='line' id='LC54'>					<span class="p">}</span></div><div class='line' id='LC55'>				<span class="p">}</span> <span class="k">else</span> <span class="k">if</span> <span class="p">(</span><span class="nx">$element</span><span class="p">.</span><span class="nx">hasClass</span><span class="p">(</span><span class="s1">&#39;placeholder&#39;</span><span class="p">))</span> <span class="p">{</span></div><div class='line' id='LC56'>					<span class="nx">clearPlaceholder</span><span class="p">.</span><span class="nx">call</span><span class="p">(</span><span class="nx">element</span><span class="p">,</span> <span class="kc">true</span><span class="p">,</span> <span class="nx">value</span><span class="p">)</span> <span class="o">||</span> <span class="p">(</span><span class="nx">element</span><span class="p">.</span><span class="nx">value</span> <span class="o">=</span> <span class="nx">value</span><span class="p">);</span></div><div class='line' id='LC57'>				<span class="p">}</span> <span class="k">else</span> <span class="p">{</span></div><div class='line' id='LC58'>					<span class="nx">element</span><span class="p">.</span><span class="nx">value</span> <span class="o">=</span> <span class="nx">value</span><span class="p">;</span></div><div class='line' id='LC59'>				<span class="p">}</span></div><div class='line' id='LC60'>				<span class="c1">// `set` can not return `undefined`; see http://jsapi.info/jquery/1.7.1/val#L2363</span></div><div class='line' id='LC61'>				<span class="k">return</span> <span class="nx">$element</span><span class="p">;</span></div><div class='line' id='LC62'>			<span class="p">}</span></div><div class='line' id='LC63'>		<span class="p">};</span></div><div class='line' id='LC64'><br/></div><div class='line' id='LC65'>		<span class="nx">isInputSupported</span> <span class="o">||</span> <span class="p">(</span><span class="nx">valHooks</span><span class="p">.</span><span class="nx">input</span> <span class="o">=</span> <span class="nx">hooks</span><span class="p">);</span></div><div class='line' id='LC66'>		<span class="nx">isTextareaSupported</span> <span class="o">||</span> <span class="p">(</span><span class="nx">valHooks</span><span class="p">.</span><span class="nx">textarea</span> <span class="o">=</span> <span class="nx">hooks</span><span class="p">);</span></div><div class='line' id='LC67'><br/></div><div class='line' id='LC68'>		<span class="nx">$</span><span class="p">(</span><span class="kd">function</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC69'>			<span class="c1">// Look for forms</span></div><div class='line' id='LC70'>			<span class="nx">$</span><span class="p">(</span><span class="nb">document</span><span class="p">).</span><span class="nx">delegate</span><span class="p">(</span><span class="s1">&#39;form&#39;</span><span class="p">,</span> <span class="s1">&#39;submit.placeholder&#39;</span><span class="p">,</span> <span class="kd">function</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC71'>				<span class="c1">// Clear the placeholder values so they don&#39;t get submitted</span></div><div class='line' id='LC72'>				<span class="kd">var</span> <span class="nx">$inputs</span> <span class="o">=</span> <span class="nx">$</span><span class="p">(</span><span class="s1">&#39;.placeholder&#39;</span><span class="p">,</span> <span class="k">this</span><span class="p">).</span><span class="nx">each</span><span class="p">(</span><span class="nx">clearPlaceholder</span><span class="p">);</span></div><div class='line' id='LC73'>				<span class="nx">setTimeout</span><span class="p">(</span><span class="kd">function</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC74'>					<span class="nx">$inputs</span><span class="p">.</span><span class="nx">each</span><span class="p">(</span><span class="nx">setPlaceholder</span><span class="p">);</span></div><div class='line' id='LC75'>				<span class="p">},</span> <span class="mi">10</span><span class="p">);</span></div><div class='line' id='LC76'>			<span class="p">});</span></div><div class='line' id='LC77'>		<span class="p">});</span></div><div class='line' id='LC78'><br/></div><div class='line' id='LC79'>		<span class="c1">// Clear placeholder values upon page reload</span></div><div class='line' id='LC80'>		<span class="nx">$</span><span class="p">(</span><span class="nb">window</span><span class="p">).</span><span class="nx">bind</span><span class="p">(</span><span class="s1">&#39;beforeunload.placeholder&#39;</span><span class="p">,</span> <span class="kd">function</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC81'>			<span class="nx">$</span><span class="p">(</span><span class="s1">&#39;.placeholder&#39;</span><span class="p">).</span><span class="nx">each</span><span class="p">(</span><span class="kd">function</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC82'>				<span class="k">this</span><span class="p">.</span><span class="nx">value</span> <span class="o">=</span> <span class="s1">&#39;&#39;</span><span class="p">;</span></div><div class='line' id='LC83'>			<span class="p">});</span></div><div class='line' id='LC84'>		<span class="p">});</span></div><div class='line' id='LC85'><br/></div><div class='line' id='LC86'>	<span class="p">}</span></div><div class='line' id='LC87'><br/></div><div class='line' id='LC88'>	<span class="kd">function</span> <span class="nx">args</span><span class="p">(</span><span class="nx">elem</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC89'>		<span class="c1">// Return an object of element attributes</span></div><div class='line' id='LC90'>		<span class="kd">var</span> <span class="nx">newAttrs</span> <span class="o">=</span> <span class="p">{},</span></div><div class='line' id='LC91'>		    <span class="nx">rinlinejQuery</span> <span class="o">=</span> <span class="sr">/^jQuery\d+$/</span><span class="p">;</span></div><div class='line' id='LC92'>		<span class="nx">$</span><span class="p">.</span><span class="nx">each</span><span class="p">(</span><span class="nx">elem</span><span class="p">.</span><span class="nx">attributes</span><span class="p">,</span> <span class="kd">function</span><span class="p">(</span><span class="nx">i</span><span class="p">,</span> <span class="nx">attr</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC93'>			<span class="k">if</span> <span class="p">(</span><span class="nx">attr</span><span class="p">.</span><span class="nx">specified</span> <span class="o">&amp;&amp;</span> <span class="o">!</span><span class="nx">rinlinejQuery</span><span class="p">.</span><span class="nx">test</span><span class="p">(</span><span class="nx">attr</span><span class="p">.</span><span class="nx">name</span><span class="p">))</span> <span class="p">{</span></div><div class='line' id='LC94'>				<span class="nx">newAttrs</span><span class="p">[</span><span class="nx">attr</span><span class="p">.</span><span class="nx">name</span><span class="p">]</span> <span class="o">=</span> <span class="nx">attr</span><span class="p">.</span><span class="nx">value</span><span class="p">;</span></div><div class='line' id='LC95'>			<span class="p">}</span></div><div class='line' id='LC96'>		<span class="p">});</span></div><div class='line' id='LC97'>		<span class="k">return</span> <span class="nx">newAttrs</span><span class="p">;</span></div><div class='line' id='LC98'>	<span class="p">}</span></div><div class='line' id='LC99'><br/></div><div class='line' id='LC100'>	<span class="kd">function</span> <span class="nx">clearPlaceholder</span><span class="p">(</span><span class="nx">event</span><span class="p">,</span> <span class="nx">value</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC101'>		<span class="kd">var</span> <span class="nx">input</span> <span class="o">=</span> <span class="k">this</span><span class="p">,</span></div><div class='line' id='LC102'>		    <span class="nx">$input</span> <span class="o">=</span> <span class="nx">$</span><span class="p">(</span><span class="nx">input</span><span class="p">);</span></div><div class='line' id='LC103'>		<span class="k">if</span> <span class="p">(</span><span class="nx">input</span><span class="p">.</span><span class="nx">value</span> <span class="o">==</span> <span class="nx">$input</span><span class="p">.</span><span class="nx">attr</span><span class="p">(</span><span class="s1">&#39;placeholder&#39;</span><span class="p">)</span> <span class="o">&amp;&amp;</span> <span class="nx">$input</span><span class="p">.</span><span class="nx">hasClass</span><span class="p">(</span><span class="s1">&#39;placeholder&#39;</span><span class="p">))</span> <span class="p">{</span></div><div class='line' id='LC104'>			<span class="k">if</span> <span class="p">(</span><span class="nx">$input</span><span class="p">.</span><span class="nx">data</span><span class="p">(</span><span class="s1">&#39;placeholder-password&#39;</span><span class="p">))</span> <span class="p">{</span></div><div class='line' id='LC105'>				<span class="nx">$input</span> <span class="o">=</span> <span class="nx">$input</span><span class="p">.</span><span class="nx">hide</span><span class="p">().</span><span class="nx">next</span><span class="p">().</span><span class="nx">show</span><span class="p">().</span><span class="nx">attr</span><span class="p">(</span><span class="s1">&#39;id&#39;</span><span class="p">,</span> <span class="nx">$input</span><span class="p">.</span><span class="nx">removeAttr</span><span class="p">(</span><span class="s1">&#39;id&#39;</span><span class="p">).</span><span class="nx">data</span><span class="p">(</span><span class="s1">&#39;placeholder-id&#39;</span><span class="p">));</span></div><div class='line' id='LC106'>				<span class="c1">// If `clearPlaceholder` was called from `$.valHooks.input.set`</span></div><div class='line' id='LC107'>				<span class="k">if</span> <span class="p">(</span><span class="nx">event</span> <span class="o">===</span> <span class="kc">true</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC108'>					<span class="k">return</span> <span class="nx">$input</span><span class="p">[</span><span class="mi">0</span><span class="p">].</span><span class="nx">value</span> <span class="o">=</span> <span class="nx">value</span><span class="p">;</span></div><div class='line' id='LC109'>				<span class="p">}</span></div><div class='line' id='LC110'>				<span class="nx">$input</span><span class="p">.</span><span class="nx">focus</span><span class="p">();</span></div><div class='line' id='LC111'>			<span class="p">}</span> <span class="k">else</span> <span class="p">{</span></div><div class='line' id='LC112'>				<span class="nx">input</span><span class="p">.</span><span class="nx">value</span> <span class="o">=</span> <span class="s1">&#39;&#39;</span><span class="p">;</span></div><div class='line' id='LC113'>				<span class="nx">$input</span><span class="p">.</span><span class="nx">removeClass</span><span class="p">(</span><span class="s1">&#39;placeholder&#39;</span><span class="p">);</span></div><div class='line' id='LC114'>				<span class="nx">input</span> <span class="o">==</span> <span class="nb">document</span><span class="p">.</span><span class="nx">activeElement</span> <span class="o">&amp;&amp;</span> <span class="nx">input</span><span class="p">.</span><span class="nx">select</span><span class="p">();</span></div><div class='line' id='LC115'>			<span class="p">}</span></div><div class='line' id='LC116'>		<span class="p">}</span></div><div class='line' id='LC117'>	<span class="p">}</span></div><div class='line' id='LC118'><br/></div><div class='line' id='LC119'>	<span class="kd">function</span> <span class="nx">setPlaceholder</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC120'>		<span class="kd">var</span> <span class="nx">$replacement</span><span class="p">,</span></div><div class='line' id='LC121'>		    <span class="nx">input</span> <span class="o">=</span> <span class="k">this</span><span class="p">,</span></div><div class='line' id='LC122'>		    <span class="nx">$input</span> <span class="o">=</span> <span class="nx">$</span><span class="p">(</span><span class="nx">input</span><span class="p">),</span></div><div class='line' id='LC123'>		    <span class="nx">$origInput</span> <span class="o">=</span> <span class="nx">$input</span><span class="p">,</span></div><div class='line' id='LC124'>		    <span class="nx">id</span> <span class="o">=</span> <span class="k">this</span><span class="p">.</span><span class="nx">id</span><span class="p">;</span></div><div class='line' id='LC125'>		<span class="k">if</span> <span class="p">(</span><span class="nx">input</span><span class="p">.</span><span class="nx">value</span> <span class="o">==</span> <span class="s1">&#39;&#39;</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC126'>			<span class="k">if</span> <span class="p">(</span><span class="nx">input</span><span class="p">.</span><span class="nx">type</span> <span class="o">==</span> <span class="s1">&#39;password&#39;</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC127'>				<span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="nx">$input</span><span class="p">.</span><span class="nx">data</span><span class="p">(</span><span class="s1">&#39;placeholder-textinput&#39;</span><span class="p">))</span> <span class="p">{</span></div><div class='line' id='LC128'>					<span class="k">try</span> <span class="p">{</span></div><div class='line' id='LC129'>						<span class="nx">$replacement</span> <span class="o">=</span> <span class="nx">$input</span><span class="p">.</span><span class="nx">clone</span><span class="p">().</span><span class="nx">attr</span><span class="p">({</span> <span class="s1">&#39;type&#39;</span><span class="o">:</span> <span class="s1">&#39;text&#39;</span> <span class="p">});</span></div><div class='line' id='LC130'>					<span class="p">}</span> <span class="k">catch</span><span class="p">(</span><span class="nx">e</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC131'>						<span class="nx">$replacement</span> <span class="o">=</span> <span class="nx">$</span><span class="p">(</span><span class="s1">&#39;&lt;input&gt;&#39;</span><span class="p">).</span><span class="nx">attr</span><span class="p">(</span><span class="nx">$</span><span class="p">.</span><span class="nx">extend</span><span class="p">(</span><span class="nx">args</span><span class="p">(</span><span class="k">this</span><span class="p">),</span> <span class="p">{</span> <span class="s1">&#39;type&#39;</span><span class="o">:</span> <span class="s1">&#39;text&#39;</span> <span class="p">}));</span></div><div class='line' id='LC132'>					<span class="p">}</span></div><div class='line' id='LC133'>					<span class="nx">$replacement</span></div><div class='line' id='LC134'>						<span class="p">.</span><span class="nx">removeAttr</span><span class="p">(</span><span class="s1">&#39;name&#39;</span><span class="p">)</span></div><div class='line' id='LC135'>						<span class="p">.</span><span class="nx">data</span><span class="p">({</span></div><div class='line' id='LC136'>							<span class="s1">&#39;placeholder-password&#39;</span><span class="o">:</span> <span class="kc">true</span><span class="p">,</span></div><div class='line' id='LC137'>							<span class="s1">&#39;placeholder-id&#39;</span><span class="o">:</span> <span class="nx">id</span></div><div class='line' id='LC138'>						<span class="p">})</span></div><div class='line' id='LC139'>						<span class="p">.</span><span class="nx">bind</span><span class="p">(</span><span class="s1">&#39;focus.placeholder&#39;</span><span class="p">,</span> <span class="nx">clearPlaceholder</span><span class="p">);</span></div><div class='line' id='LC140'>					<span class="nx">$input</span></div><div class='line' id='LC141'>						<span class="p">.</span><span class="nx">data</span><span class="p">({</span></div><div class='line' id='LC142'>							<span class="s1">&#39;placeholder-textinput&#39;</span><span class="o">:</span> <span class="nx">$replacement</span><span class="p">,</span></div><div class='line' id='LC143'>							<span class="s1">&#39;placeholder-id&#39;</span><span class="o">:</span> <span class="nx">id</span></div><div class='line' id='LC144'>						<span class="p">})</span></div><div class='line' id='LC145'>						<span class="p">.</span><span class="nx">before</span><span class="p">(</span><span class="nx">$replacement</span><span class="p">);</span></div><div class='line' id='LC146'>				<span class="p">}</span></div><div class='line' id='LC147'>				<span class="nx">$input</span> <span class="o">=</span> <span class="nx">$input</span><span class="p">.</span><span class="nx">removeAttr</span><span class="p">(</span><span class="s1">&#39;id&#39;</span><span class="p">).</span><span class="nx">hide</span><span class="p">().</span><span class="nx">prev</span><span class="p">().</span><span class="nx">attr</span><span class="p">(</span><span class="s1">&#39;id&#39;</span><span class="p">,</span> <span class="nx">id</span><span class="p">).</span><span class="nx">show</span><span class="p">();</span></div><div class='line' id='LC148'>				<span class="c1">// Note: `$input[0] != input` now!</span></div><div class='line' id='LC149'>			<span class="p">}</span></div><div class='line' id='LC150'>			<span class="nx">$input</span><span class="p">.</span><span class="nx">addClass</span><span class="p">(</span><span class="s1">&#39;placeholder&#39;</span><span class="p">);</span></div><div class='line' id='LC151'>			<span class="nx">$input</span><span class="p">[</span><span class="mi">0</span><span class="p">].</span><span class="nx">value</span> <span class="o">=</span> <span class="nx">$input</span><span class="p">.</span><span class="nx">attr</span><span class="p">(</span><span class="s1">&#39;placeholder&#39;</span><span class="p">);</span></div><div class='line' id='LC152'>		<span class="p">}</span> <span class="k">else</span> <span class="p">{</span></div><div class='line' id='LC153'>			<span class="nx">$input</span><span class="p">.</span><span class="nx">removeClass</span><span class="p">(</span><span class="s1">&#39;placeholder&#39;</span><span class="p">);</span></div><div class='line' id='LC154'>		<span class="p">}</span></div><div class='line' id='LC155'>	<span class="p">}</span></div><div class='line' id='LC156'><br/></div><div class='line' id='LC157'><span class="p">}(</span><span class="k">this</span><span class="p">,</span> <span class="nb">document</span><span class="p">,</span> <span class="nx">jQuery</span><span class="p">));</span></div></pre></div>
          </td>
        </tr>
      </table>
  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="http://developer.github.com">API</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>

    </ul>

    <a href="/">
      <span class="mega-octicon octicon-mark-github"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2013 <span title="0.06526s from fe4.rs.github.com">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
          <div class="suggester-container">
              <div class="suggester fullscreen-suggester js-navigation-container" id="fullscreen_suggester"
                 data-url="/mathiasbynens/jquery-placeholder/suggestions/commit">
              </div>
          </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped leftwards" title="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped leftwards"
      title="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-remove-close close ajax-error-dismiss"></a>
      Something went wrong with that request. Please try again.
    </div>

    
  </body>
</html>


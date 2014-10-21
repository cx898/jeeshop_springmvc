/**
 * 百度信任登陆
 */
(function (frontia) {

    var msg = document.getElementById('some-msg');

    // API key 从应用信息页面获取
    var AK = 'QvwMOKYlTcHKAQMviglSfAah';
    // 在应用管理页面下的 社会化服务 - 基础设置中设置该地址
    //var redirect_url = 'http://frontiajsdemo.duapp.com/social/baidu.html';
    var redirect_url = 'http://myshop.itelse.com';

    // 初始化 frontia
    frontia.init(AK);

    // 设置登录成功后的回调
    frontia.social.setLoginCallback({
      success: function (user) {
        console.log(user);

        // 如果用户已经登录，则显示用户的登录信息
        msg.innerHTML = 'name = ' + user.getName() + '<br>' +
            'token = ' + user.getAccessToken() + '<br>' +
            'social_id = ' + user.getId() + '<br>' +
            'expires_in = ' + user.getExpiresIn();
      },
      error: function (error) {
        console.log('error');
        console.log(error)
      }
    });

    // 点击登录按钮
    document.getElementById('login-test').addEventListener('click', function (ev) {

      // 初始化登录的配置
      var options = {
        response_type: 'token',
        media_type: 'baidu',  // 登录百度帐号
        redirect_uri: redirect_url,
        client_type: 'web',
        scope: 'netdisk'
      };

      // 登录
      frontia.social.login(options);
    });

    var user;
    user = frontia.getCurrentAccount();

    // 判断用户是否登录
    if (user && user.getType() === 'user' && user.getMediaType() === 'baidu') {

      // 如果用户已经登录，则显示用户的登录信息
      msg.innerHTML = 'name = ' + user.getName() + '<br>' +
          'token = ' + user.getAccessToken() + '<br>' +
          'social_id = ' + user.getId() + '<br>' +
          'expires_in = ' + user.getExpiresIn();

    }

  }(baidu.frontia));
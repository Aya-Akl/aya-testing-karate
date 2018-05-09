function() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {//base config JSON
    env: env,
    appId: 'my.app.id',
    appSecret: 'my.secret',
    githubBaseURL: 'https://api.github.com',
	  myVarName: 'someValue'
  }
  if (env == 'test') {
    config.githubBaseURL = 'https://api.github.com'
  } else if (env == 'dev') {
    config.githubBaseURL = 'https://api.github.com/user'
  } else if (enc == 'production') {
    config.githubBaseURL = 'https://api.github.com'
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}
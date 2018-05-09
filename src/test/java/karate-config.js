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
    githubBaseURL: 'https://api.github.com/',
	  myVarName: 'someValue'
  }
  if (env == 'test') {
    // customize
    // e.g. config.foo = 'bar';
    config.githubBaseURL = 'https://api.github.com/user'
  } else if (env == 'production') {
    config.githubBaseURL = 'https://api.github.com/user'
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}

//run certain env from maven >> mvn test -DargLine="-Dkarate.env=e2e"

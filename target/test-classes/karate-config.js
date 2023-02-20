function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    baseUrl: 'https://simple-books-api.glitch.me/'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  var accessToken = karate.callSingle('classpath:examples/users/auth.feature',config).token 
  console.log('this is a log from the js file with the token: ', accessToken)
  karate.configure('headers', {Authorization:'Bearer ' + accessToken})
  return config;
}
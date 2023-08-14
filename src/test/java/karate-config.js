function fn() {   
  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'qa'; // a custom 'intelligent' default
  }
  var config = { // base config JSON
    apiKey : 'FEBA477E-FC36-4A65-B644-4FBBF788D262',
    subscriptionKey : '000e66f7ee544da6896d5f9e62c1f1e3',
    baseUrl: 'https://clubhouse-api-test.aboutgolf.com',
    facilityId : '67a044eb-bb41-4d69-8913-4659e72bccaf'
  };
  if (env == 'stage') {
    // over-ride only those that need to be
    config.baseUrl = 'https://clubhouse-api-test.aboutgolf.com';
  } else if (env == 'dev') {
    config.baseUrl = 'https://clubhouse-api-test.aboutgolf.com';
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
    // add pretty json on requests and reponses
    karate.configure('logPrettyRequest', true);
    karate.configure('logPrettyResponse', true);
  return config;
}
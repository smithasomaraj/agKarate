function getRandomString(length) {
	var num = "";
  		var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
  		for(var i=0;i<length;i++)
  			num += pattern.charAt(Math.floor(Math.random() * pattern.length()));
  		return num;
  		
}
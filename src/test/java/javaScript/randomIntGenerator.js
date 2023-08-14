function getRandomInt(length) {
  		var num = "";
  		var pattern = "1234567890";
  		for(var i=0;i<length;i++)
  			num += pattern.charAt(Math.floor(Math.random() * pattern.length()));
  		return num;	
  	}
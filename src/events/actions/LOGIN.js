module.exports = function(data, callback){
	var hash = [],
			mysql = this.mysql;
	for (var i = 0; i < 32; i++){
		var rand = Math.ceil(Math.random() * 0xFFF).toString(16)[0];
		hash.push(Math.ceil(Math.random() * 2) == 1 ? rand.toLowerCase() : rand.toUpperCase());
	}
	hash = hash.join("");

	mysql.query({
		sql: 'INSERT INTO `sessions` (`hash`) SELECT ? AS `hash` FROM `users` WHERE `email` = ? AND `password` = ?',
		timeout: 1000,
		values: [
			hash,
			data.email.toLowerCase(),
			data.password
		]
	}, function(err, responce){
		!responce ? 
			callback(err) : 
			callback({
				hash: hash
			});
	});
}
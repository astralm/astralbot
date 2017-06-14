module.exports = function(data, callback){
	var mysql = this.mysql;
	mysql.query({
		sql: "INSERT INTO `users` (`name`, `surname`, `email`, `password`, `phone`) VALUES (?,?,?,?,?)",
		timeout: 1000,
		values: [
			data.name,
			data.surname,
			data.email,
			data.password,
			data.phone
		]
	}, callback);
}
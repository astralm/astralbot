module.exports = function(data, callback){
	var mysql = this.mysql;
	console.log(data.hash + "   CREATE_BRANCH.js");
	mysql.query({
		sql: "SELECT id FROM `users` WHERE `hash` = ?",
		timeout: 1000,
		values: [
			data.hash
		]
	}, function(err, response){
		err == null && response.length != 0 ? 
			mysql.query({
				sql: "INSERT INTO `branches`(`name`, `description`, `creator_id`) VALUES (?,?,?)",
				timeout: 1000,
				values: [
					data.name.toLowerCase(),
					data.description,
					response[0].id
				]
			}, callback) :
			callback(err, response);
	})
}
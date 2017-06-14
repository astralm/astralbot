module.exports = function(data, callback){
	var mysql = this.mysql;

	mysql.query({
		sql: "SELECT id, type FROM `users` WHERE `hash` = ?",
		timeout: 1000,
		values: [
			data.hash
		]
	}, function(err, response){
		err == null && response.length != 0 ?
			(response.type == "root" || response.type == "admin") ?
				mysql.query({
					sql: "DELETE FROM `branches` WHERE `creator_id` = ? AND `name` = ?",
					timeout: 1000,
					values: [
						response[0].id,
						data.name.toLowerCase()
					]
				}, callback) :
				callback(response) :
			callback(err, response)
	})
}
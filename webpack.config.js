module.exports = {
	entry: "./src/index.js",
	module: {
		rules: [{
			test: /\.js$/,
			loader: 'babel-loader',
			query: {
				presets: ['es2015']
			}
		}]
	},
	output: {
		path: __dirname + "/build",
		filename: 'bundle.js'
	}
}
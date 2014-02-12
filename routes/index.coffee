m = require 'methodder'
module.exports = class Index
	constructor:(@app, @db)->
		# navigation bar
		@app.locals nav:{Home:"/","Write New Puzzle":"/writer"}
		@app.get '/', m @get, @
		@app.post '/', m @post, @
		@login = new (require('./login'))(@app, @db)
		@register = new (require('./register'))(@app, @db)
		@writer = new (require('./writer'))(@app, @db)
	get: (req, res) ->
		res.render('index', {
			title: 'Inkblur'
			user: req.session.user
		})
	post: (req, res) ->
		console.log req.body
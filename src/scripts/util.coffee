
class Vec

	x: 0
	y: 0

	@immutable: ->
		v = new Vec arguments
		Object.freeze(v)

	@polar: (r, t) ->
		x = Math.cos(t) * r
		y = Math.sin(t) * r
		new Vec x, y

	constructor: ->
		if arguments.length == 1
			v = arguments[0]
			@x = v.x
			@y = v.y
		else if arguments.length == 2
			[@x, @y] = arguments

	add: (v) ->
		@x += v.x
		@y += v.y
		this

	sub: (v) ->
		@x -= v.x
		@y -= v.y
		this

	mul: (s) ->
		@x *= s
		@y *= s

	div: (s) ->
		@x /= s
		@y /= s

	clamp: (s) ->
		if @x > s
			@mul(s / @x)
		if @y > s
			@mul(s / @y)

	lengthSquared: ->
		return @x*@x + @y*@y

	length: ->
		Math.sqrt @lengthSquared()

	angle: ->
		return clampAngleSigned Math.atan2 @y, @x

Vec.zero = Vec.immutable 0, 0
Vec.one = Vec.immutable 1, 1

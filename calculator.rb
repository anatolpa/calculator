class Calculator
	attr_reader :result, :a, :b, :operation

	def initialize(a = 1, b = 2, operation = 'add')
		@operations = ['add', 'subtract', 'multiply', 'divide']
		@a = a
		@b = b
		@operation = operation
		check
	end

	def setup(a = nil, b = nil, operation = nil)
	    @a = a ? a : @a
		@b = b ? b : @b
		@operation = operation ? operation : @operation
  	end

  	def check()
		raise "Cannot execute not valid operation '#{@operation}'" unless @operations.include? @operation
		@a = cast_type @a
		@b = cast_type @b
  	end

  	def cast_type(param)
  		return param if param.is_a? Numeric
		return param.to_i if param.is_a? String
		raise "Unsupported type in argument: '#{param}'"
  	end

	def run(*input)
		setup(*input) if input.length > 0
		check
		case @operation
			when 'add'
				@result = @a + @b
			when 'subtract'
				@result = @a - @b
			when 'multiply'
			  	@result = @a * @b
			when 'divide'
			  	@result = @a / @b
		end
		@result
	end

	private :setup, :check, :cast_type
end

calc = Calculator.new 3, 3, 'add'
puts calc.run
puts calc.run 10, 5, 'divide'
# puts calc.run 2, 3, 'test'
# puts calc.run 3, 0, 'divide'
# puts calc.run '2', true
#voter_sim4.rb

require 'minitest/autorun'

class World
	attr_accessor :politicians, :voters

	def initialize
		# @politicians = []
		# @voters = []
	end

	# def add_politician(politician)
	# 	@politicians << politician
	# 	final_decision
	# end

	world = World.new
end

class Person
	attr_accessor :name

	def initialize(name)
		@name = name
	end

end

class Politician < Person
	attr_accessor :party

	def initialize(name, party)
		super(name)
		@party = party
	end

	def to_s
		"#{name} (#{@party})"
	end

end

class Voter < Person
	attr_accessor :politics

	def initialize(name, politics)
		super(name)
		@politics = politics
	end

	def to_s
		"#{name} (#{@politics})"
	end

end

@voters = []

def create_voter
	puts "Name?"
	name = gets.chomp
	puts "Politics?"
	politics = gets.chomp
	voter = Voter.new(name, politics)
	@voters.push(voter)
	final_decision
end

def list_voters
	puts @voters

	final_decision
end

@politicians = []

def create_politician
	puts "Name?"
	name = gets.chomp
	puts "Party Affiliation: Democrat or Republican?"
	party = gets.chomp
	politician = Politician.new(name, party)
	@politicians.push(politician)
	final_decision
end



def list_politicians
	puts @politicians
	final_decision
end

def update_politician
		puts "Which politician would you like to update: "
		puts "#{@politicians}"
		pick_politician = gets.chomp.downcase
		puts "what would you like to change? Name or Party"
		old_name = gets.chomp.downcase
		puts "What would you like the name to be? "
		new_politician_name = gets.chomp.downcase

		@politicians.map! { |name| 
			if (name == "#{pick_politician}") ; new_politician_name
			else
				name
			end
		}

		final_decision
end
# def add_voter(voter)
# 		@voters << voter
# 		final_decision
# end

# class TestVoterSim < Minitest::Test

def main_menu
	puts "What would you like to do? Create, List, Update, or Vote"
	@answer1 = gets.chomp.downcase
end

def create
	puts "What would you like to create: Politician or Voter"
	@create = gets.chomp.downcase
end

def list_method
	puts "What would you like a list of: Voters or Politicians"
	@list = gets.chomp.downcase
end

def update
	puts "What would you like to update: Voters or Politicians"
	@update = gets.chomp.downcase
end

def final_decision
	puts "Would you like to return to main menu or end?"
	last_decision = gets.chomp.downcase
	if last_decision == "main menu"
		voter_sim
	else
		puts "Have a nice day!"
	end
end



def voter_sim

	main_menu

	if @answer1 == "create"
		create
		if @create == "voter"
			create_voter
		elsif @create == "politician"
			create_politician
		end
	elsif @answer1 == "list"
		list_method
		if @list == "voters"
			list_voters
		elsif @list == "politicians"
			list_politicians
		end
	elsif @answer1 == "update"
		update
		if @update == "voters"
			update_voters
		elsif @update == "politicians"
			update_politician
		end


	end

end

voter_sim



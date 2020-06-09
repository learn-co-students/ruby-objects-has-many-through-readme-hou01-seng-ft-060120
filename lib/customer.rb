class Customer
    attr_accessor :name, :age, :total, :tip
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals 
        my_meals = []
        Meal.all.each do |meal|
            if(meal.customer == self)
                my_meals << meal
            end
        end
        my_meals
    end

    def waiters
        my_waiters = []
        Meal.all.each do |meal|
            if(meal.customer == self)
                my_waiters << meal.waiter
            end
        end
        my_waiters
    end

end
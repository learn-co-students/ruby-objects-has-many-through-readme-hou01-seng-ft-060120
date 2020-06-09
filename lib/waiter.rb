class Waiter
    attr_accessor :name, :years
    @@all = []

    def initialize(name, years)
        @name = name
        @years = years
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals 
        my_meals = []
        Meal.all.each do |meal|
            if(meal.waiter == self)
                my_meals << meal
            end
        end
        my_meals
    end

    def best_tipper
        best_tipper = nil
        tip = 0
        Meal.all.each do |meal|
            if(meal.tip > tip)
                best_tipper = meal.customer
                tip += 1
            end
        end
        best_tipper
    end
end
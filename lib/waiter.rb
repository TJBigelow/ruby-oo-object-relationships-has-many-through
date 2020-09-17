class Waiter
    attr_reader :name, :years
    @@all
    def initialize (name, years)
        @name = name
        @years = years
        self.class.all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        @best_tipper = nil
        @best_tip = 0
        meals.each {|meal| if meal.tip > @best_tip; @best_tipper = meal.customer; @best_tip = meal.tip; end}
        @best_tipper
    end
end
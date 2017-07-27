class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
		tall_enough = self.user.height > self.attraction.min_height
		enough_tickets = self.user.tickets > self.attraction.tickets
		if tall_enough && enough_tickets
			self.user.tickets -= self.attraction.tickets
			self.user.nausea += self.attraction.nausea_rating
			self.user.happiness += self.attraction.happiness_rating
			self.user.save
			"Thanks for riding the #{self.attraction.name}!"
		else
			message = "Sorry."
			message += " You do not have enough tickets to ride the #{self.attraction.name}." if !enough_tickets
			message += " You are not tall enough to ride the #{self.attraction.name}." if !tall_enough
			message

		end
  end
end

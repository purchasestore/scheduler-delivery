class Meeting < ApplicationRecord
	acts_as_list

	def self.sort_position_per_cep(date)
		@meetings = Meeting.where(start_time: Time.parse(date).all_day)
											 .order(cep: :asc)
		@meetings.each_with_index do |meeting, index|
			meeting.update(position: index + 1)
		end		
	end

end

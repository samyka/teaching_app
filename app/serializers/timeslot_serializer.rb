class TimeslotSerializer < ActiveModel::Serializer
  attributes :id, :start, :end, :title

 	def title
 		"Available"
 	end

  def start
  	format_time(object.start_time)
  end

  def end
  	format_time(object.end_time)
  end

  private
		def format_time(t)
			t.strftime("%Y-%m-%dT%H:%M:%S%z")
		end
end

module Cta
  module rail

  def get_data
    resp = HTTParty.get("http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=#{TRAIN_KEY}&stpid=#{stop_id}")
    resp["ctatt"]["eta"].map do |t|
     {
      time_left: ( (t["arrT"].to_time - Time.now) / 60 ).to_i,
      heading: t["stpDe"],
      train: Train.find_by_cta_key(t["rt"]).name
     }
  end
 end
end
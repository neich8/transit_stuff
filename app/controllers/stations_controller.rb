class StationsController < ApplicationController

  def schedule
    schedule = get_schedule
    schedule = sort_(schedule)
    render json: schedule
  end

  private

  def get_schedule
    schedule = arrival_times.map do |t|
     if train.cta_key == t["rt"] 
       {
        time_left: ( (t["arrT"].to_time - Time.now) / 60 ).to_i,
        heading: t["stpDe"],
        train: train.name
       }
     end
    end
    schedule.compact
  end

  def arrival_times
    # resp = HTTParty.get("http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=#{TRAIN_KEY}&mapid=#{stop_id}")
    # resp["ctatt"]["eta"]
    fake_request
  end

  def stop_id
    Station.find(params[:id]).map_id
  end

  def sort_(schedule)
    schedule.sort{|a, b| a[:heading] <=> b[:heading]}
  end

  def train
    Train.find(params[:train])
  end

  def fake_request
    [{"staId"=>"41320",
  "stpId"=>"30257",
  "staNm"=>"Belmont",
  "stpDe"=>"Service toward Kimball or Linden",
  "rn"=>"431",
  "rt"=>"Brn",
  "destSt"=>"30249",
  "destNm"=>"Kimball",
  "trDr"=>"1",
  "prdt"=>"20151123 21:59:17",
  "arrT"=>"20151123 22:00:17",
  "isApp"=>"1",
  "isSch"=>"0",
  "isDly"=>"0",
  "isFlt"=>"0",
  "flags"=>nil,
  "lat"=>"41.93658",
  "lon"=>"-87.65329",
  "heading"=>"357"},
 {"staId"=>"41320",
  "stpId"=>"30258",
  "staNm"=>"Belmont",
  "stpDe"=>"Service toward Loop",
  "rn"=>"427",
  "rt"=>"Brn",
  "destSt"=>"30249",
  "destNm"=>"Loop",
  "trDr"=>"5",
  "prdt"=>"20151123 21:59:19",
  "arrT"=>"20151123 22:01:19",
  "isApp"=>"0",
  "isSch"=>"0",
  "isDly"=>"0",
  "isFlt"=>"0",
  "flags"=>nil,
  "lat"=>"41.94389",
  "lon"=>"-87.65985",
  "heading"=>"88"},
 {"staId"=>"41320",
  "stpId"=>"30255",
  "staNm"=>"Belmont",
  "stpDe"=>"Service toward Howard",
  "rn"=>"922",
  "rt"=>"Red",
  "destSt"=>"30173",
  "destNm"=>"Howard",
  "trDr"=>"1",
  "prdt"=>"20151123 21:58:31",
  "arrT"=>"20151123 22:03:31",
  "isApp"=>"0",
  "isSch"=>"0",
  "isDly"=>"0",
  "isFlt"=>"0",
  "flags"=>nil,
  "lat"=>"41.91065",
  "lon"=>"-87.64918",
  "heading"=>"305"},
 {"staId"=>"41320",
  "stpId"=>"30258",
  "staNm"=>"Belmont",
  "stpDe"=>"Service toward Loop",
  "rn"=>"423",
  "rt"=>"Brn",
  "destSt"=>"30249",
  "destNm"=>"Loop",
  "trDr"=>"5",
  "prdt"=>"20151123 21:59:04",
  "arrT"=>"20151123 22:09:04",
  "isApp"=>"0",
  "isSch"=>"0",
  "isDly"=>"0",
  "isFlt"=>"0",
  "flags"=>nil,
  "lat"=>"41.96625",
  "lon"=>"-87.6885",
  "heading"=>"88"},
 {"staId"=>"41320",
  "stpId"=>"30256",
  "staNm"=>"Belmont",
  "stpDe"=>"Service toward 95th/Dan Ryan",
  "rn"=>"919",
  "rt"=>"Red",
  "destSt"=>"30089",
  "destNm"=>"95th/Dan Ryan",
  "trDr"=>"5",
  "prdt"=>"20151123 21:52:03",
  "arrT"=>"20151123 22:02:03",
  "isApp"=>"0",
  "isSch"=>"0",
  "isDly"=>"1",
  "isFlt"=>"0",
  "flags"=>nil,
  "lat"=>"41.97345",
  "lon"=>"-87.65853",
  "heading"=>"178"},
 {"staId"=>"41320",
  "stpId"=>"30257",
  "staNm"=>"Belmont",
  "stpDe"=>"Service toward Kimball or Linden",
  "rn"=>"421",
  "rt"=>"Brn",
  "destSt"=>"30249",
  "destNm"=>"Kimball",
  "trDr"=>"1",
  "prdt"=>"20151123 21:59:19",
  "arrT"=>"20151123 22:10:19",
  "isApp"=>"0",
  "isSch"=>"0",
  "isDly"=>"0",
  "isFlt"=>"0",
  "flags"=>nil,
  "lat"=>"41.90108",
  "lon"=>"-87.6367",
  "heading"=>"355"},
 {"staId"=>"41320",
  "stpId"=>"30255",
  "staNm"=>"Belmont",
  "stpDe"=>"Service toward Howard",
  "rn"=>"835",
  "rt"=>"Red",
  "destSt"=>"30173",
  "destNm"=>"Howard",
  "trDr"=>"1",
  "prdt"=>"20151123 21:59:12",
  "arrT"=>"20151123 22:11:12",
  "isApp"=>"0",
  "isSch"=>"0",
  "isDly"=>"0",
  "isFlt"=>"0",
  "flags"=>nil,
  "lat"=>"41.88618",
  "lon"=>"-87.62784",
  "heading"=>"356"},
 {"staId"=>"41320",
  "stpId"=>"30256",
  "staNm"=>"Belmont",
  "stpDe"=>"Service toward 95th/Dan Ryan",
  "rn"=>"839",
  "rt"=>"Red",
  "destSt"=>"30089",
  "destNm"=>"95th/Dan Ryan",
  "trDr"=>"5",
  "prdt"=>"20151123 21:59:16",
  "arrT"=>"20151123 22:11:16",
  "isApp"=>"0",
  "isSch"=>"0",
  "isDly"=>"0",
  "isFlt"=>"0",
  "flags"=>nil,
  "lat"=>"41.97798",
  "lon"=>"-87.65867",
  "heading"=>"178"},
 {"staId"=>"41320",
  "stpId"=>"30255",
  "staNm"=>"Belmont",
  "stpDe"=>"Service toward Howard",
  "rn"=>"933",
  "rt"=>"Red",
  "destSt"=>"30173",
  "destNm"=>"Howard",
  "trDr"=>"1",
  "prdt"=>"20151123 21:58:57",
  "arrT"=>"20151123 22:13:57",
  "isApp"=>"0",
  "isSch"=>"0",
  "isDly"=>"0",
  "isFlt"=>"0",
  "flags"=>nil,
  "lat"=>"41.87815",
  "lon"=>"-87.6276",
  "heading"=>"357"}]

  end
end

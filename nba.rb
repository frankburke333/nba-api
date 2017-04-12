require 'httparty'
require 'json'

 # example of an NBA API request:
 # stats.nba.com/stats/scoreboard/?GameDate=02/14/2015&LeagueID=00&DayOffset=0

 # endpoint = "scoreboard"
 # endpoint_params = "?GameDate=02/14/2015&LeagueID=00&DayOffset=0"
 # # url = "http://stats.nba.com/stats/#{endpoint}/#{endpoint_params}"

 url = "http://stats.nba.com/stats/leaguedashteamstats?Conference=&DateFrom=&DateTo=&Division=&GameScope=&GameSegment=&LastNGames=0&LeagueID=00&Location=&MeasureType=Base&Month=0&OpponentTeamID=0&Outcome=&PORound=0&PaceAdjust=N&PerMode=PerGame&Period=0&PlayerExperience=&PlayerPosition=&PlusMinus=N&Rank=N&Season=2016-17&SeasonSegment=&SeasonType=Regular Season&ShotClockRange=&StarterBench=&TeamID=0&VsConference=&VsDivision="
 headers = {
   "DNT" => '1',
   "Accept-Encoding" => 'gzip, deflate, sdch',
   "Accept-Language" => 'en',
   "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36",
   "Accept" => "*/*",
   "Referer" => "http://stats.nba.com/",
   "Connection" => "keep-alive"
 }

 response = HTTParty.get(url, headers: headers)
 # puts response.body, response.code, response.message, response.headers.inspect
 # response.body[:rowSet].each do |p|
 #   puts p
 # end
 body = JSON.parse(response.body)
 body["resultSets"].each do |set|
   set["rowSet"].each do |team|
     # puts team[set["headers"].index("TEAM_ID")]
     # puts team[set["headers"].index("TEAM_NAME")]

     name = team[set["headers"].index("TEAM_NAME")]
     wins = team[set["headers"].index("W")]

     if wins > 50
       puts name
     end
   end
 end

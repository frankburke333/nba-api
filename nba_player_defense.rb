require 'httparty'
require 'json'


url = "http://stats.nba.com/stats/leaguedashplayerstats?College=&Conference=&Country=&DateFrom=&DateTo=&Division=&DraftPick=&DraftYear=&GameScope=&GameSegment=&Height=&LastNGames=0&LeagueID=00&Location=&MeasureType=Defense&Month=0&OpponentTeamID=0&Outcome=&PORound=0&PaceAdjust=N&PerMode=PerGame&Period=0&PlayerExperience=&PlayerPosition=&PlusMinus=N&Rank=N&Season=2016-17&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&StarterBench=&TeamID=0&VsConference=&VsDivision=&Weight="
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
# #
# #
body = JSON.parse(response.body)
body["resultSets"].each do |set|
  set["rowSet"].each do |team|
    # puts team[set["headers"].index("TEAM_ID")]
    # puts team[set["headers"].index("TEAM_NAME")]

    player_id = team[set["headers"].index("PLAYER_ID")]
    player_name = team[set["headers"].index("PLAYER_NAME")]
    team_id = team[set["headers"].index("TEAM_ID")]
    team_abbreviation = team[set["headers"].index("TEAM_ABBREVIATION")]
    age = team[set["headers"].index("AGE")]
    games_played = team[set["headers"].index("GP")]
    wins = team[set["headers"].index("W")]
    losses = team[set["headers"].index("L")]
    winning_percentage = team[set["headers"].index("W_PCT")]
    minutes = team[set["headers"].index("MIN")]
    defensive_rating = team[set["headers"].index("DEF_RATING")]
    dreb = team[set["headers"].index("DREB")]
    dreb_pct = team[set["headers"].index("DREB_PCT")]
    pct_dreb = team[set["headers"].index("PCT_DREB")]
    stl = team[set["headers"].index("STL")]
    pct_stl = team[set["headers"].index("PCT_STL")]
    blk = team[set["headers"].index("BLK")]
    pct_pts_off_tov = team[set["headers"].index("PCT_PTS_OFF_TOV")]
    pct_blk = team[set["headers"].index("PCT_BLK")]
    opp_pts_off_tov = team[set["headers"].index("OPP_PTS_OFF_TOV")]
    opp_pts_2nd_chance = team[set["headers"].index("OPP_PTS_2ND_CHANCE")]
    opp_pts_fb = team[set["headers"].index("OPP_PTS_FB")]
    opp_pts_paint = team[set["headers"].index("OPP_PTS_PAINT")]
    def_ws = team[set["headers"].index("DEF_WS")]
    gp_rank = team[set["headers"].index("GP_RANK")]
    games_played_rank = team[set["headers"].index("GP_RANK")]
    wins_rank = team[set["headers"].index("W_RANK")]
    loss_rank = team[set["headers"].index("L_RANK")]
    winning_percentage_rank = team[set["headers"].index("W_PCT_RANK")]
    min_rank = team[set["headers"].index("MIN_RANK")]
    def_rating_rank = team[set["headers"].index("DEF_RATING_RANK")]
    dreb_rank = team[set["headers"].index("DREB_RANK")]
    dreb_pct_rank = team[set["headers"].index("DREB_PCT_RANK")]
    pct_dreb_rank = team[set["headers"].index("PCT_DREB_RANK")]
    stl_rank = team[set["headers"].index("STL_RANK")]
    pct_stl_rank = team[set["headers"].index("PCT_STL_RANK")]
    blk_rank = team[set["headers"].index("BLK_RANK")]
    pct_blk_rank = team[set["headers"].index("PCT_BLK_RANK")]
    opp_pts_off_tov_rank = team[set["headers"].index("OPP_PTS_OFF_TOV_RANK")]
    opp_pts_2nd_chance_rank = team[set["headers"].index("OPP_PTS_2ND_CHANCE_RANK")]
    opp_pts_fb_rank = team[set["headers"].index("OPP_PTS_FB_RANK")]
    opp_pts_paint_rank = team[set["headers"].index("OPP_PTS_PAINT_RANK")]
    def_ws_rank = team[set["headers"].index("DEF_WS_RANK")]



    if minutes > 20
      puts "Teams in TOP 10 in Opposition FG%, 3pt%, Turnovers and Margin of Victory"

      puts "
      ============================================
      #{player_name}:
      Minutes: #{minutes}
      Defensive Rating: #{def_rating}
      ============================================
      "
    end
  end
end

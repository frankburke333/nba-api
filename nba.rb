require 'httparty'
require 'json'

# example of an NBA API request:
# stats.nba.com/stats/scoreboard/?GameDate=02/14/2015&LeagueID=00&DayOffset=0

# endpoint = "scoreboard"
# endpoint_params = "?GameDate=02/14/2015&LeagueID=00&DayOffset=0"
# # url = "http://stats.nba.com/stats/#{endpoint}/#{endpoint_params}"

url = "http://stats.nba.com/stats/leaguedashteamstats?Conference=&DateFrom=&DateTo=&Division=&GameScope=&GameSegment=&LastNGames=0&LeagueID=00&Location=&MeasureType=Base&Month=0&OpponentTeamID=0&Outcome=&PORound=0&PaceAdjust=N&PerMode=PerGame&Period=0&PlayerExperience=&PlayerPosition=&PlusMinus=N&Rank=N&Season=2016-17&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&StarterBench=&TeamID=0&VsConference=&VsDivision="
response = HTTParty.get(url, headers: {})

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
    losses = team[set["headers"].index("L")]
    games = team[set["headers"].index("GP")]
    winning_percentage = team[set["headers"].index("W_PCT")]
    minutes = team[set["headers"].index("MIN")]
    fgm = team[set["headers"].index("FGM")]
    fga = team[set["headers"].index("FGA")]
    fg_percentage = team[set["headers"].index("FG_PCT")]
    three_pt_a = team[set["headers"].index("FG3M")]
    three_pt_m = team[set["headers"].index("FG3A")]
    three_pt_percentage = team[set["headers"].index("FG3_PCT")]
    ftm = team[set["headers"].index("FTM")]
    fta = team[set["headers"].index("FTA")]
    ft_percentage = team[set["headers"].index("FT_PCT")]
    oreb = team[set["headers"].index("OREB")]
    dreb = team[set["headers"].index("DREB")]
    reb = team[set["headers"].index("REB")]
    assists = team[set["headers"].index("AST")]
    tov = team[set["headers"].index("TOV")]
    stl = team[set["headers"].index("STL")]
    blk = team[set["headers"].index("BLK")]
    blka = team[set["headers"].index("BLKA")]
    personal_fouls = team[set["headers"].index("PF")]
    personal_fouls_drawn = team[set["headers"].index("PFD")]
    points = team[set["headers"].index("PTS")]
    plus_minus = team[set["headers"].index("PLUS_MINUS")]
    games_played_rank = team[set["headers"].index("GP_RANK")]
    wins_rank = team[set["headers"].index("W_RANK")]
    loss_rank = team[set["headers"].index("L_RANK")]
    winning_percentage_rank = team[set["headers"].index("AST")]
    min_rank = team[set["headers"].index("MIN_RANK")]
    fgm_rank = team[set["headers"].index("FGM_RANK")]
    fga_rank = team[set["headers"].index("FGA_RANK")]
    fg_pct_rank = team[set["headers"].index("FG_PCT_RANK")]
    three_pt_m_rank = team[set["headers"].index("FG3M_RANK")]
    three_pt_a_rank = team[set["headers"].index("FG3A_RANK")]
    three_pt_percentage_rank = team[set["headers"].index("FG3_PCT_RANK")]
    ftm_rank = team[set["headers"].index("FTM_RANK")]
    fta_rank = team[set["headers"].index("FTA_RANK")]
    ft_percentage_rank = team[set["headers"].index("FT_PCT_RANK")]
    oreb_rank = team[set["headers"].index("OREB_RANK")]
    dreb_rank = team[set["headers"].index("DREB_RANK")]
    ast_rank = team[set["headers"].index("AST_RANK")]
    tov_rank = team[set["headers"].index("TOV_RANK")]
    stl_rank = team[set["headers"].index("STL_RANK")]
    blk_rank = team[set["headers"].index("BLK_RANK")]
    blka_rank = team[set["headers"].index("BLKA_RANK")]
    pf_rank = team[set["headers"].index("PF_RANK")]
    pfd_rank = team[set["headers"].index("PFD_RANK")]
    pfd_rank = team[set["headers"].index("PFD_RANK")]
    pts_rank = team[set["headers"].index("PTS_RANK")]
    plus_minus_rank = team[set["headers"].index("PLUS_MINUS_RANK")]




    if wins_rank < 6 && three_pt_percentage_rank < 6 && ast_rank < 6
      puts name
    end
  end
end

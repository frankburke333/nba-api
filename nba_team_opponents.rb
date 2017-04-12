require 'httparty'
require 'json'


url = "http://stats.nba.com/stats/leaguedashteamstats?Conference=&DateFrom=&DateTo=&Division=&GameScope=&GameSegment=&LastNGames=0&LeagueID=00&Location=&MeasureType=Opponent&Month=0&OpponentTeamID=0&Outcome=&PORound=0&PaceAdjust=N&PerMode=PerGame&Period=0&PlayerExperience=&PlayerPosition=&PlusMinus=N&Rank=N&Season=2016-17&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&StarterBench=&TeamID=0&VsConference=&VsDivision="
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
#
#
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
    opp_fgm = team[set["headers"].index("OPP_FGM")]
    opp_fga = team[set["headers"].index("OPP_FGA")]
    opp_fg_percentage = team[set["headers"].index("OPP_FG_PCT")]
    opp_three_pt_a = team[set["headers"].index("OPP_FG3M")]
    opp_three_pt_m = team[set["headers"].index("OPP_FG3A")]
    opp_three_pt_percentage = team[set["headers"].index("OPP_FG3_PCT")]
    opp_ftm = team[set["headers"].index("OPP_FTM")]
    opp_fta = team[set["headers"].index("OPP_FTA")]
    opp_ft_percentage = team[set["headers"].index("OPP_FT_PCT")]
    opp_oreb = team[set["headers"].index("OPP_OREB")]
    opp_dreb = team[set["headers"].index("OPP_DREB")]
    opp_reb = team[set["headers"].index("OPP_REB")]
    opp_assists = team[set["headers"].index("OPP_AST")]
    opp_tov = team[set["headers"].index("OPP_TOV")]
    opp_stl = team[set["headers"].index("OPP_STL")]
    opp_blk = team[set["headers"].index("OPP_BLK")]
    opp_blka = team[set["headers"].index("OPP_BLKA")]
    opp_personal_fouls = team[set["headers"].index("OPP_PF")]
    opp_personal_fouls_drawn = team[set["headers"].index("OPP_PFD")]
    opp_points = team[set["headers"].index("OPP_PTS")]
    plus_minus = team[set["headers"].index("PLUS_MINUS")]
    games_played_rank = team[set["headers"].index("GP_RANK")]
    wins_rank = team[set["headers"].index("W_RANK")]
    loss_rank = team[set["headers"].index("L_RANK")]
    winning_percentage_rank = team[set["headers"].index("W_PCT_RANK")]
    min_rank = team[set["headers"].index("MIN_RANK")]
    opp_fgm_rank = team[set["headers"].index("OPP_FGM_RANK")]
    opp_fga_rank = team[set["headers"].index("OPP_FGA_RANK")]
    opp_fg_pct_rank = team[set["headers"].index("OPP_FG_PCT_RANK")]
    opp_three_pt_m_rank = team[set["headers"].index("OPP_FG3M_RANK")]
    opp_three_pt_a_rank = team[set["headers"].index("OPP_FG3A_RANK")]
    opp_three_pt_percentage_rank = team[set["headers"].index("OPP_FG3_PCT_RANK")]
    opp_ftm_rank = team[set["headers"].index("OPP_FTM_RANK")]
    opp_fta_rank = team[set["headers"].index("OPP_FTA_RANK")]
    opp_ft_percentage_rank = team[set["headers"].index("OPP_FT_PCT_RANK")]
    opp_oreb_rank = team[set["headers"].index("OPP_OREB_RANK")]
    opp_dreb_rank = team[set["headers"].index("OPP_DREB_RANK")]
    opp_ast_rank = team[set["headers"].index("OPP_AST_RANK")]
    opp_tov_rank = team[set["headers"].index("OPP_TOV_RANK")]
    opp_stl_rank = team[set["headers"].index("OPP_STL_RANK")]
    opp_blk_rank = team[set["headers"].index("OPP_BLK_RANK")]
    opp_blka_rank = team[set["headers"].index("OPP_BLKA_RANK")]
    opp_pf_rank = team[set["headers"].index("OPP_PF_RANK")]
    opp_pfd_rank = team[set["headers"].index("OPP_PFD_RANK")]
    opp_pfd_rank = team[set["headers"].index("OPP_PFD_RANK")]
    opp_pts_rank = team[set["headers"].index("OPP_PTS_RANK")]
    plus_minus_rank = team[set["headers"].index("PLUS_MINUS_RANK")]




    if opp_tov_rank < 11 && opp_three_pt_percentage_rank < 11 && opp_fg_pct_rank < 11
      puts "

      ELITE DEFENSE

      Teams in TOP 10 in Opposition FG%, 3pt%, Turnovers and Margin of Victory"

      puts "

      ============================================
      #{name}:
      Opposition FG%: #{opp_fg_percentage},  Rank: #{opp_fg_pct_rank}
      Opposition 3pt%: #{opp_three_pt_percentage}, Rank: #{opp_three_pt_percentage_rank}
      Opposition Turnover Rank: #{opp_tov}, Rank: #{opp_tov_rank}
      Margin of Victory: #{plus_minus}, Rank: #{plus_minus_rank}
      Winning Percentage: #{winning_percentage}
      ============================================
      "
    end
  end
end

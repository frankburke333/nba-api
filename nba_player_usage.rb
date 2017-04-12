require 'httparty'
require 'json'


# curl 'http://stats.nba.com/stats/scoreboardV2?DayOffset=0&LeagueID=00&gameDate=04/09/2017' -H 'DNT: 1' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36' -H 'Accept: */*' -H 'Referer: http://stats.nba.com/' -H
# 'Connection: keep-alive' --compressed



url = "http://stats.nba.com/stats/leaguedashplayerstats?College=&Conference=&Country=&DateFrom=&DateTo=&Division=&DraftPick=&DraftYear=&GameScope=&GameSegment=&Height=&LastNGames=0&LeagueID=00&Location=&MeasureType=Usage&Month=0&OpponentTeamID=0&Outcome=&PORound=0&PaceAdjust=N&PerMode=PerGame&Period=0&PlayerExperience=&PlayerPosition=&PlusMinus=N&Rank=N&Season=2016-17&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&StarterBench=&TeamID=0&VsConference=&VsDivision=&Weight="
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
    usage = team[set["headers"].index("USG_PCT")]
    pct_fgm = team[set["headers"].index("PCT_FGM")]
    pct_fga = team[set["headers"].index("PCT_FGA")]
    pct_3fgm = team[set["headers"].index("PCT_FG3M")]
    pct_3fga = team[set["headers"].index("PCT_FG3A")]
    pct_ftm = team[set["headers"].index("PCT_FTM")]
    pct_fta = team[set["headers"].index("PCT_FTA")]
    pct_oreb = team[set["headers"].index("PCT_OREB")]
    pct_dreb = team[set["headers"].index("PCT_DREB")]
    pct_reb = team[set["headers"].index("PCT_REB")]
    pct_ast = team[set["headers"].index("PCT_AST")]
    pct_tov = team[set["headers"].index("PCT_TOV")]
    pct_stl = team[set["headers"].index("PCT_STL")]
    pct_blk = team[set["headers"].index("PCT_BLK")]
    pct_blka = team[set["headers"].index("PCT_BLKA")]
    pct_pf = team[set["headers"].index("PCT_PF")]
    pct_pfd = team[set["headers"].index("PCT_PFD")]
    pct_pts = team[set["headers"].index("PCT_PTS")]
    gp_rank = team[set["headers"].index("GP_RANK")]
    w_rank = team[set["headers"].index("W_RANK")]
    l_rank = team[set["headers"].index("L_RANK")]
    w_pct_rank = team[set["headers"].index("W_PCT_RANK")]
    min_rank = team[set["headers"].index("MIN_RANK")]
    usg_pct_rank = team[set["headers"].index("USG_PCT_RANK")]
    pct_fgm_rank = team[set["headers"].index("PCT_FGM_RANK")]
    pct_fga_rank = team[set["headers"].index("PCT_FGA_RANK")]
    pct_3fga_rank = team[set["headers"].index("PCT_FG3A_RANK")]
    pct_ftm_rank = team[set["headers"].index("PCT_FTM_RANK")]
    pct_fta_rank = team[set["headers"].index("PCT_FTA_RANK")]
    pct_oreb_rank = team[set["headers"].index("PCT_OREB_RANK")]
    pct_dreb_rank = team[set["headers"].index("PCT_DREB_RANK")]
    pct_reb_rank = team[set["headers"].index("PCT_REB_RANK")]
    pct_ast_rank = team[set["headers"].index("PCT_AST_RANK")]
    pct_tov_rank = team[set["headers"].index("PCT_TOV_RANK")]
    pct_stl_rank = team[set["headers"].index("PCT_STL_RANK")]
    pct_blk_rank = team[set["headers"].index("PCT_BLK_RANK")]
    pct_blka_rank = team[set["headers"].index("PCT_BLKA_RANK")]
    pct_pf_rank = team[set["headers"].index("PCT_PFD_RANK")]
    pct_pts_rank = team[set["headers"].index("PCT_PTS_RANK")]



    if minutes > 25 && pct_pts_rank < 11
      puts "Percentage of Points Scored"

      puts "
      ============================================
      #{player_name}:
      Minutes: #{minutes}
      Percentage of Points scored:#{pct_pts}
      Percentage of Points Scored Rank: #{pct_pts_rank}
      ============================================
      "
    end
  end
end

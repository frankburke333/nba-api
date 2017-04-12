require 'httparty'
require 'json'


  url = "http://stats.nba.com/stats/leaguedashplayerstats?College=&Conference=&Country=&DateFrom=&DateTo=&Division=&DraftPick=&DraftYear=&GameScope=&GameSegment=&Height=&LastNGames=0&LeagueID=00&Location=&MeasureType=Scoring&Month=0&OpponentTeamID=0&Outcome=&PORound=0&PaceAdjust=N&PerMode=PerGame&Period=0&PlayerExperience=&PlayerPosition=&PlusMinus=N&Rank=N&Season=2016-17&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&StarterBench=&TeamID=0&VsConference=&VsDivision=&Weight="
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
puts response.body, response.code, response.message, response.headers.inspect
# #
# # #
# body = JSON.parse(response.body)
# body["resultSets"].each do |set|
#   set["rowSet"].each do |team|
#     # puts team[set["headers"].index("TEAM_ID")]
#     # puts team[set["headers"].index("TEAM_NAME")]
#
#     player_id = team[set["headers"].index("PLAYER_ID")]
#     player_name = team[set["headers"].index("PLAYER_NAME")]
#     team_id = team[set["headers"].index("TEAM_ID")]
#     team_abbreviation = team[set["headers"].index("TEAM_ABBREVIATION")]
#     age = team[set["headers"].index("AGE")]
#     games_played = team[set["headers"].index("GP")]
#     wins = team[set["headers"].index("W")]
#     losses = team[set["headers"].index("L")]
#     winning_percentage = team[set["headers"].index("W_PCT")]
#     minutes = team[set["headers"].index("MIN")]
#     pct_fga_2pt = team[set["headers"].index("PCT_FGA_2PT")]
#     pct_fga_3pt = team[set["headers"].index("PCT_FGA_3PT")]
#     pct_pts_2pt = team[set["headers"].index("PCT_PTS_2PT")]
#     pct_pts_2pt_mr = team[set["headers"].index("PCT_PTS_2PT_MR")]
#     pct_pts_3pt = team[set["headers"].index("PCT_PTS_3PT")]
#     pct_pts_fb = team[set["headers"].index("PCT_PTS_FB")]
#     pct_pts_ft = team[set["headers"].index("PCT_PTS_FT")]
#     pct_pts_off_tov = team[set["headers"].index("PCT_PTS_OFF_TOV")]
#     pct_pts_paint = team[set["headers"].index("PCT_PTS_PAINT")]
#     pct_ast_2pm = team[set["headers"].index("PCT_AST_2PM")]
#     pct_uast_2pm = team[set["headers"].index("PCT_UAST_2PM")]
#     pct_ast_3pm = team[set["headers"].index("PCT_AST_3PM")]
#     pct_uast_3pm = team[set["headers"].index("PCT_UAST_3PM")]
#     pct_ast_fgm = team[set["headers"].index("PCT_AST_FGM")]
#     pct_uast_fgm = team[set["headers"].index("PCT_UAST_FGM")]
#     games_played_rank = team[set["headers"].index("GP_RANK")]
#     wins_rank = team[set["headers"].index("W_RANK")]
#     loss_rank = team[set["headers"].index("L_RANK")]
#     winning_percentage_rank = team[set["headers"].index("W_PCT_RANK")]
#     min_rank = team[set["headers"].index("MIN_RANK")]
#     pct_fga_2pt_rank = team[set["headers"].index("PCT_FGA_2PT_RANK")]
#     pct_fga_3pt_rank = team[set["headers"].index("PCT_FGA_3PT_RANK")]
#     pct_pts_2pt_rank = team[set["headers"].index("PCT_PTS_2PT_RANK")]
#     pct_pts_2pt_mr_rank = team[set["headers"].index("PCT_PTS_2PT_MR")]
#     pct_pts_3pt_rank = team[set["headers"].index("PCT_PTS_3PT_RANK")]
#     pct_pts_fb_rank = team[set["headers"].index("PCT_PTS_FB_RANK")]
#     pct_pts_ft_rank = team[set["headers"].index("PCT_PTS_FT_RANK")]
#     pct_pts_off_tov_rank = team[set["headers"].index("PCT_PTS_OFF_TOV_RANK")]
#     pct_pts_paint_rank = team[set["headers"].index("PCT_PTS_PAINT_RANK")]
#     pct_ast_2pm_rank = team[set["headers"].index("PCT_AST_2PM_RANK")]
#     pct_uast_2pm_rank = team[set["headers"].index("PCT_UAST_2PM_RANK")]
#     pct_ast_3pm_rank = team[set["headers"].index("PCT_AST_3PM_RANK")]
#     pct_uast_3pm_rank = team[set["headers"].index("PCT_UAST_3PM_RANK")]
#     pct_ast_fgm_rank = team[set["headers"].index("PCT_AST_FGM_RANK")]
#     pct_uast_fgm_rank = team[set["headers"].index("PCT_UAST_FGM_RANK")]
#
#
#
#     if minutes > 25
#       puts "Teams in TOP 10 in Opposition FG%, 3pt%, Turnovers and Margin of Victory"
#
#       puts "
#       ============================================
#       #{player_name}:
#       Minutes: #{minutes}
#       Percentage of 3ptFGM:#{pct_uast_3pm}
#       ============================================
#       "
#     end
#   end
# end

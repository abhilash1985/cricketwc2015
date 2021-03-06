# namespace :import do
#   # desc "Import FIFA master data"
#   # task fifa_master_data: [:fifa_tournaments, :fifa_stadiums, :fifa_teams, :fifa_rounds,
#   #                         :fifa_matches, :fifa_questions, :fifa_match_questions,
#   #                         :fifa_challenges] do
#   #   # for initial run include :questions, :match_questions, :challenges
#   # end

#   # desc 'Import tournament data'
#   # task fifa_tournaments: :environment do
#   #   tournament = Tournament.fifa_world_cup.russia.first_or_initialize
#   #   tournament.start_date = '14-06-2018'
#   #   tournament.end_date = '15-07-2018'
#   #   tournament.save
#   #   p "Imported Tournaments..."
#   # end

#   # desc 'Import Groups'
#   # task fifa_stadiums: :environment do
#   #   stadiums = %W(Group\ A Group\ B Group\ C Group\ D Group\ E Group\ F Group\ G Group\ H)
#   #   stadiums.each do |stadium|
#   #     stadium = Stadium.by_name(stadium).first_or_initialize
#   #     stadium.save
#   #   end
#   #   p "Imported Groups..."
#   # end

#   # desc 'Import teams'
#   # task fifa_teams: :environment do
#   #   teams = { 'Germany' => 1, 'Brazil' => 2, 'Russia' => 70, 'Japan' => 61,
#   #             'Saudi Arabia' => 67, 'Egypt' => 45, 'Uruguay' => 14, 'Portugal' => 4,
#   #             'Spain' => 10, 'Morocco' => 41, 'Iran' => 37, 'France' => 7,
#   #             'Australia' => 36, 'Peru' => 11, 'Denmark' => 12, 'Switzerland' => 6,
#   #             'Argentina' => 5, 'Iceland' => 22, 'Croatia' => 20, 'Nigeria' => 48,
#   #             'Costa Rica' => 23, 'Serbia' => 34, 'Mexico' => 15, 'Sweden' => 24,
#   #             'South Korea' => 57, 'Belgium' => 3, 'Panama' => 55, 'Tunisia' => 21,
#   #             'England' => 12, 'Poland' => 8, 'Senegal' => 27, 'Colombia' => 16
#   #           }
#   #   teams.each do |team, rank|
#   #     team = Team.by_name(team).first_or_initialize
#   #     team.rank = rank
#   #     team.save
#   #   end
#   #   p "Imported Teams..."
#   # end

#   # desc 'Import rounds'
#   # task fifa_rounds: :environment do
#   #   %w(Group-Stage Round-Of-16 Quarter-Final Semi-Final Play-Off Final).each do |name|
#   #     round = Round.by_name(name).first_or_initialize
#   #     round.save
#   #   end
#   #   p "Imported Rounds..."
#   # end

#   # desc 'Import players'
#   # task fifa_players: :environment do
#   #   begin
#   #     file = "db/data/fifa_players.xls"
#   #     Spreadsheet.open(file) do |sheet|
#   #       sheet1 = sheet.worksheet 0
#   #       sheet1.each 1 do |row|
#   #         next if row[0].blank?
#   #         team = Team.by_name(row[0].strip).first
#   #         next if team.blank?
#   #         player = team.players.by_first_name(row[1].strip).first_or_initialize
#   #         player.player_style = row[2].strip
#   #         player.save
#   #       end
#   #     end
#   #     p "Imported players"
#   #   rescue => e
#   #     puts "Error while importing #{e} #{e.backtrace}"
#   #   end
#   # end

#   # desc 'Import Matches'
#   # task fifa_matches: :environment do
#   #   # ActiveRecord::Base.connection.execute 'TRUNCATE matches'
#   #   url = 'https://raw.githubusercontent.com/lsv/fifa-worldcup-2018/master/data.json'

#   #   data = JSON.parse(open(url).read).with_indifferent_access

#   #   matches_array = []
#   #   data['groups'].each do |_group, values|
#   #     group_name = values['name']
#   #     values['matches'].each do |group_match|
#   #       matches_array << [group_match, group_name]
#   #     end
#   #   end


#   #   @match_no = 1
#   #   matches_array.sort_by { |x| x[0]['date'].to_time }.each do |m|
#   #     group_match = m[0]
#   #     group_name = m[1]

#   #     team1_id = group_match['home_team']
#   #     team1 = find_team_name(team1_id, data)
#   #     next if team1.blank?
#   #     team2_id = group_match['away_team']
#   #     team2 = find_team_name(team2_id, data)
#   #     next if team2.blank?

#   #     match = Match.by_match_no(@match_no).first_or_initialize
#   #     match.team1_id = team1.id
#   #     match.team2_id = team2.id

#   #     stadium = Stadium.like_name(group_name).first

#   #     match.stadium_id = stadium.try(:id)
#   #     match.match_date = group_match['date'].to_time

#   #     round = Round.by_name('Group-Stage').first
#   #     match.round_id = round.try(:id)

#   #     @match_no += 1 if match.save
#   #   end
#   # end

#   # def find_team_name(team_id, data)
#   #   team_data = data['teams'].select { |x| x['id'].to_i == team_id.to_i }[0]
#   #   team_name = team_data['name']
#   #   team_fifa_code = team_data['fifaCode']
#   #   team_flag = team_data['flag']
#   #   team = Team.by_name(team_name).first || Team.by_name(team_fifa_code).first
#   #   return if team.blank?
#   #   team.update(short_name: team_fifa_code, flag: team_flag)
#   #   team
#   # end

#   # desc 'Import questions'
#   # task fifa_questions: :environment do
#   #   # ActiveRecord::Base.connection.execute 'TRUNCATE questions'
#   #   questions = {
#   #     # defaults
#   #     'Who will win the match?' => 5,
#   #     'Goals scored by Argentina?' => 3,
#   #     'Goals scored by Australia?' => 3,
#   #     'Goals scored by Belgium?' => 3,
#   #     'Goals scored by Brazil?' => 3,
#   #     'Goals scored by Colombia?' => 3,
#   #     'Goals scored by Costa Rica?' => 3,
#   #     'Goals scored by Croatia?' => 3,
#   #     'Goals scored by Denmark?' => 3,
#   #     'Goals scored by Egypt?' => 3,
#   #     'Goals scored by England?' => 3,
#   #     'Goals scored by France?' => 3,
#   #     'Goals scored by Germany?' => 3,
#   #     'Goals scored by Iceland?' => 3,
#   #     'Goals scored by Iran?' => 3,
#   #     'Goals scored by Japan?' => 3,
#   #     'Goals scored by Mexico?' => 3,
#   #     'Goals scored by Morocco?' => 3,
#   #     'Goals scored by Nigeria?' => 3,
#   #     'Goals scored by Panama?' => 3,
#   #     'Goals scored by Peru?' => 3,
#   #     'Goals scored by Poland?' => 3,
#   #     'Goals scored by Portugal?' => 3,
#   #     'Goals scored by Russia?' => 3,
#   #     'Goals scored by Saudi Arabia?' => 3,
#   #     'Goals scored by Senegal?' => 3,
#   #     'Goals scored by Serbia?' => 3,
#   #     'Goals scored by South Korea?' => 3,
#   #     'Goals scored by Spain?' => 3,
#   #     'Goals scored by Sweden?' => 3,
#   #     'Goals scored by Switzerland?' => 3,
#   #     'Goals scored by Tunisia?' => 3,
#   #     'Goals scored by Uruguay?' => 3,
#   #     # Cards
#   #     'No of Yellow cards in the match' => 2,
#   #     'No of Red cards in the match' => 2,
#   #     'No of Offsides in the match' => 2,
#   #     'No of Corners in the match' => 2,
#   #     'No of Fouls in the match' => 2,
#   #     # Shots
#   #     'Total shots by Argentina?' => 2,
#   #     'Total shots by Australia?' => 2,
#   #     'Total shots by Belgium?' => 2,
#   #     'Total shots by Brazil?' => 2,
#   #     'Total shots by Colombia?' => 2,
#   #     'Total shots by Costa Rica?' => 2,
#   #     'Total shots by Croatia?' => 2,
#   #     'Total shots by Denmark?' => 2,
#   #     'Total shots by Egypt?' => 2,
#   #     'Total shots by England?' => 2,
#   #     'Total shots by France?' => 2,
#   #     'Total shots by Germany?' => 2,
#   #     'Total shots by Iceland?' => 2,
#   #     'Total shots by Iran?' => 2,
#   #     'Total shots by Japan?' => 2,
#   #     'Total shots by Mexico?' => 2,
#   #     'Total shots by Morocco?' => 2,
#   #     'Total shots by Nigeria?' => 2,
#   #     'Total shots by Panama?' => 2,
#   #     'Total shots by Peru?' => 2,
#   #     'Total shots by Poland?' => 2,
#   #     'Total shots by Portugal?' => 2,
#   #     'Total shots by Russia?' => 2,
#   #     'Total shots by Saudi Arabia?' => 2,
#   #     'Total shots by Senegal?' => 2,
#   #     'Total shots by Serbia?' => 2,
#   #     'Total shots by South Korea?' => 2,
#   #     'Total shots by Spain?' => 2,
#   #     'Total shots by Sweden?' => 2,
#   #     'Total shots by Switzerland?' => 2,
#   #     'Total shots by Tunisia?' => 2,
#   #     'Total shots by Uruguay?' => 2,

#   #     'Total shots on Target by Argentina?' => 2,
#   #     'Total shots on Target by Australia?' => 2,
#   #     'Total shots on Target by Belgium?' => 2,
#   #     'Total shots on Target by Brazil?' => 2,
#   #     'Total shots on Target by Colombia?' => 2,
#   #     'Total shots on Target by Costa Rica?' => 2,
#   #     'Total shots on Target by Croatia?' => 2,
#   #     'Total shots on Target by Denmark?' => 2,
#   #     'Total shots on Target by Egypt?' => 2,
#   #     'Total shots on Target by England?' => 2,
#   #     'Total shots on Target by France?' => 2,
#   #     'Total shots on Target by Germany?' => 2,
#   #     'Total shots on Target by Iceland?' => 2,
#   #     'Total shots on Target by Iran?' => 2,
#   #     'Total shots on Target by Japan?' => 2,
#   #     'Total shots on Target by Mexico?' => 2,
#   #     'Total shots on Target by Morocco?' => 2,
#   #     'Total shots on Target by Nigeria?' => 2,
#   #     'Total shots on Target by Panama?' => 2,
#   #     'Total shots on Target by Peru?' => 2,
#   #     'Total shots on Target by Poland?' => 2,
#   #     'Total shots on Target by Portugal?' => 2,
#   #     'Total shots on Target by Russia?' => 2,
#   #     'Total shots on Target by Saudi Arabia?' => 2,
#   #     'Total shots on Target by Senegal?' => 2,
#   #     'Total shots on Target by Serbia?' => 2,
#   #     'Total shots on Target by South Korea?' => 2,
#   #     'Total shots on Target by Spain?' => 2,
#   #     'Total shots on Target by Sweden?' => 2,
#   #     'Total shots on Target by Switzerland?' => 2,
#   #     'Total shots on Target by Tunisia?' => 2,
#   #     'Total shots on Target by Uruguay?' => 2,

#   #     # Possession
#   #     'Possession percentage by Argentina?' => 2,
#   #     'Possession percentage by Australia?' => 2,
#   #     'Possession percentage by Belgium?' => 2,
#   #     'Possession percentage by Brazil?' => 2,
#   #     'Possession percentage by Colombia?' => 2,
#   #     'Possession percentage by Costa Rica?' => 2,
#   #     'Possession percentage by Croatia?' => 2,
#   #     'Possession percentage by Denmark?' => 2,
#   #     'Possession percentage by Egypt?' => 2,
#   #     'Possession percentage by England?' => 2,
#   #     'Possession percentage by France?' => 2,
#   #     'Possession percentage by Germany?' => 2,
#   #     'Possession percentage by Iceland?' => 2,
#   #     'Possession percentage by Iran?' => 2,
#   #     'Possession percentage by Japan?' => 2,
#   #     'Possession percentage by Mexico?' => 2,
#   #     'Possession percentage by Morocco?' => 2,
#   #     'Possession percentage by Nigeria?' => 2,
#   #     'Possession percentage by Panama?' => 2,
#   #     'Possession percentage by Peru?' => 2,
#   #     'Possession percentage by Poland?' => 2,
#   #     'Possession percentage by Portugal?' => 2,
#   #     'Possession percentage by Russia?' => 2,
#   #     'Possession percentage by Saudi Arabia?' => 2,
#   #     'Possession percentage by Senegal?' => 2,
#   #     'Possession percentage by Serbia?' => 2,
#   #     'Possession percentage by South Korea?' => 2,
#   #     'Possession percentage by Spain?' => 2,
#   #     'Possession percentage by Sweden?' => 2,
#   #     'Possession percentage by Switzerland?' => 2,
#   #     'Possession percentage by Tunisia?' => 2,
#   #     'Possession percentage by Uruguay?' => 2,

#   #     # Goals
#   #     'Time of first goal by Argentina?' => 2,
#   #     'Time of first goal by Australia?' => 2,
#   #     'Time of first goal by Belgium?' => 2,
#   #     'Time of first goal by Brazil?' => 2,
#   #     'Time of first goal by Colombia?' => 2,
#   #     'Time of first goal by Costa Rica?' => 2,
#   #     'Time of first goal by Croatia?' => 2,
#   #     'Time of first goal by Denmark?' => 2,
#   #     'Time of first goal by Egypt?' => 2,
#   #     'Time of first goal by England?' => 2,
#   #     'Time of first goal by France?' => 2,
#   #     'Time of first goal by Germany?' => 2,
#   #     'Time of first goal by Iceland?' => 2,
#   #     'Time of first goal by Iran?' => 2,
#   #     'Time of first goal by Japan?' => 2,
#   #     'Time of first goal by Mexico?' => 2,
#   #     'Time of first goal by Morocco?' => 2,
#   #     'Time of first goal by Nigeria?' => 2,
#   #     'Time of first goal by Panama?' => 2,
#   #     'Time of first goal by Peru?' => 2,
#   #     'Time of first goal by Poland?' => 2,
#   #     'Time of first goal by Portugal?' => 2,
#   #     'Time of first goal by Russia?' => 2,
#   #     'Time of first goal by Saudi Arabia?' => 2,
#   #     'Time of first goal by Senegal?' => 2,
#   #     'Time of first goal by Serbia?' => 2,
#   #     'Time of first goal by South Korea?' => 2,
#   #     'Time of first goal by Spain?' => 2,
#   #     'Time of first goal by Sweden?' => 2,
#   #     'Time of first goal by Switzerland?' => 2,
#   #     'Time of first goal by Tunisia?' => 2,
#   #     'Time of first goal by Uruguay?' => 2
#   #   }
#   #   questions.each do |question, weightage|
#   #     question = Question.by_question(question).first_or_initialize
#   #     question.weightage = weightage
#   #     question.save
#   #   end
#   #   p "Imported Questions..."
#   # end

#   # desc 'Import match questions'
#   # task fifa_match_questions: :environment do
#   #   # ActiveRecord::Base.connection.execute 'TRUNCATE match_questions'
#   #   # ActiveRecord::Base.connection.execute 'TRUNCATE predictions'
#   #   MatchQuestion.add_football_match_questions
#   #   p "Imported Match Questions..."
#   # end

#   # desc 'Import challenges'
#   # task fifa_challenges: :environment do
#   #   # ActiveRecord::Base.connection.execute 'TRUNCATE challenges'
#   #   Challenge.add_fifa_challenges
#   #   p "Imported Challenges..."
#   # end

#   # # KNOCKOUT QUESTIONS.............

#   # desc "Import FIFA knockout master data"
#   # task fifa_ko_master_data: [:fifa_ko_matches, :fifa_ko_questions, :fifa_ko_match_questions,
#   #                            :fifa_ko_challenges] do
#   #   # for initial run include :questions, :match_questions, :challenges
#   # end

#   # def ko_matches
#   #   {
#   #     49 => ['France', 'Argentina', '2018-06-30 19:30:00'],
#   #     50 => ['Uruguay', 'Portugal', '2018-06-30 23:30:00'],
#   #     51 => ['Spain', 'Russia', '2018-07-01 19:30:00'],
#   #     52 => ['Croatia', 'Denmark', '2018-07-01 23:30:00'],
#   #     53 => ['Brazil', 'Mexico', '2018-07-02 19:30:00'],
#   #     54 => ['Belgium', 'Japan', '2018-07-02 23:30:00'],
#   #     55 => ['Sweden', 'Switzerland', '2018-07-03 19:30:00'],
#   #     56 => ['Colombia', 'England', '2018-07-03 23:30:00']
#   #   }
#   # end


#   # desc 'Import knockout Matches'
#   # task fifa_ko_matches: :environment do
#   #   ko_matches.each do |match_no, values|
#   #     match = Match.by_match_no(match_no).first_or_initialize

#   #     team1 = Team.by_name(values[0]).first
#   #     team2 = Team.by_name(values[1]).first

#   #     next if team1.blank? || team2.blank?

#   #     match.team1_id = team1.id
#   #     match.team2_id = team2.id

#   #     stadium = Stadium.by_name('Pre-Quarter-Final').first_or_initialize
#   #     stadium.save

#   #     match.stadium_id = stadium.try(:id)
#   #     match.match_date = values[2].to_time

#   #     round = Round.by_name('Round-Of-16').first
#   #     match.round_id = round.try(:id)

#   #     match.save
#   #   end
#   # end

#   # desc 'Import knockout questions'
#   # task fifa_ko_questions: :environment do
#   #   questions = {
#   #     # defaults
#   #     'Total pass accuracy by Argentina in the match?' => 2,
#   #     'Total pass accuracy by Belgium in the match?' => 2,
#   #     'Total pass accuracy by Brazil in the match?' => 2,
#   #     'Total pass accuracy by Colombia in the match?' => 2,
#   #     'Total pass accuracy by Croatia in the match?' => 2,
#   #     'Total pass accuracy by Denmark in the match?' => 2,
#   #     'Total pass accuracy by England in the match?' => 2,
#   #     'Total pass accuracy by France in the match?' => 2,
#   #     'Total pass accuracy by Japan in the match?' => 2,
#   #     'Total pass accuracy by Mexico in the match?' => 2,
#   #     'Total pass accuracy by Portugal in the match?' => 2,
#   #     'Total pass accuracy by Russia in the match?' => 2,
#   #     'Total pass accuracy by Spain in the match?' => 2,
#   #     'Total pass accuracy by Sweden in the match?' => 2,
#   #     'Total pass accuracy by Switzerland in the match?' => 2,
#   #     'Total pass accuracy by Uruguay in the match?' => 2,

#   #     'This Match ends in?' => 3,
#   #     'Total goals in extra time?' => 2,
#   #     'Total goal attempts in the match?' => 2,
#   #     'Total no. of tackles in the match?' => 2,
#   #     'Total no. of blocks in the match?' => 2,
#   #     'Total no. of clearances in the match?' => 2,
#   #     'Total no. of cards (Yellow and Red) in the match?' => 2,

#   #     'Who scored first goal in the match?' => 2
#   #   }
#   #   questions.each do |question, weightage|
#   #     question = Question.by_question(question).first_or_initialize
#   #     question.weightage = weightage
#   #     question.save
#   #   end
#   #   p "Imported knockout Questions..."
#   # end

#   # desc 'Import knockout match questions'
#   # task fifa_ko_match_questions: :environment do
#   #   MatchQuestion.add_football_ko_match_questions
#   #   p "Imported knockout Match Questions..."
#   # end

#   # desc 'Import knockout challenges'
#   # task fifa_ko_challenges: :environment do
#   #   Challenge.add_fifa_challenges
#   #   p "Imported knockout Challenges..."
#   # end

#   # # QUARTER QUESTIONS.............

#   # desc "Import FIFA QUARTER master data"
#   # task fifa_quarter_master_data: [:fifa_quarter_matches, :fifa_quarter_questions,
#   #                                 :fifa_quarter_match_questions,
#   #                                 :fifa_quarter_challenges] do
#   #   # for initial run include :questions, :match_questions, :challenges
#   # end

#   # def quarter_matches
#   #   {
#   #     57 => ['Uruguay', 'France', '2018-07-06 19:30:00'],
#   #     58 => ['Brazil', 'Belgium', '2018-07-06 23:30:00'],
#   #     59 => ['Sweden', 'England', '2018-07-07 19:30:00'],
#   #     60 => ['Russia', 'Croatia', '2018-07-07 23:30:00']
#   #   }
#   # end


#   # desc 'Import quarter Matches'
#   # task fifa_quarter_matches: :environment do
#   #   quarter_matches.each do |match_no, values|
#   #     match = Match.by_match_no(match_no).first_or_initialize

#   #     team1 = Team.by_name(values[0]).first
#   #     team2 = Team.by_name(values[1]).first

#   #     next if team1.blank? || team2.blank?

#   #     match.team1_id = team1.id
#   #     match.team2_id = team2.id

#   #     stadium = Stadium.by_name('Quarter-Final').first_or_initialize
#   #     stadium.save

#   #     match.stadium_id = stadium.try(:id)
#   #     match.match_date = values[2]

#   #     round = Round.by_name('Quarter-Final').first
#   #     match.round_id = round.try(:id)

#   #     match.save
#   #   end
#   # end

#   # desc 'Import quarter questions'
#   # task fifa_quarter_questions: :environment do
#   #   questions = {
#   #     # defaults
#   #     'Who will score first goal for France?' => 2, # Griezmann Mbappe Giroud Pogba
#   #     # 'Who will score first goal for Uruguay?' => 2,
#   #     'Who will score first goal for Croatia?' => 2, # Modric Rebic Mandzukic Rakitic
#   #     # 'Who will score first goal for Croatia?' => 2,
#   #     'Who will score first goal for Brazil?' => 2, # Neymar Coutinho Willian Paulinho
#   #     # 'Who will score first goal for Belgium?' => 2,
#   #     # 'Who will score first goal for Sweden?' => 2,
#   #     'Who will score first goal for England?' => 2, # Kane Sterling Lingard Stones

#   #     'Who will be Man of the Match?' => 3,

#   #     'First goal in the match will be from?' => 3,

#   #     'Who will win Golden Ball of the tournament?' => 5,
#   #     'Who will win Golden Boot of the tournament?' => 5,

#   #     'Total no. of balls recovered in the match?' => 2, # 0-50 51-60 61-70 71-85 86-100 100+

#   #     'Total no. of woodworks in the match?' => 2, # 0-1 2 3 4 5 5+

#   #     'Total no. of penalties in the match?' => 2, # 0-1 2 3 4 5 5+

#   #     'Total distance(km) covered by Uruguay?' => 2, # 0-80 81-90 91-100 101-110 111-120 120+
#   #     'Total distance(km) covered by Russia?' => 2, # 0-80 81-90 91-100 101-110 111-120 120+
#   #     'Total distance(km) covered by Belgium?' => 2, # 0-80 81-90 91-100 101-110 111-120 120+
#   #     'Total distance(km) covered by Sweden?' => 2, # 0-80 81-90 91-100 101-110 111-120 120+
#   #   }
#   #   questions.each do |question, weightage|
#   #     question = Question.by_question(question).first_or_initialize
#   #     question.weightage = weightage
#   #     question.save
#   #   end
#   #   p "Imported knockout Questions..."
#   # end

#   # desc 'Import knockout match questions'
#   # task fifa_quarter_match_questions: :environment do
#   #   MatchQuestion.add_football_ko_match_questions('quarter')
#   #   p "Imported knockout Match Questions..."
#   # end

#   # desc 'Import Quarter challenges'
#   # task fifa_quarter_challenges: :environment do
#   #   Challenge.add_fifa_challenges('quarter')
#   #   p "Imported Quarter Challenges..."
#   # end

#   # def import_ko_matches(collection, match_type)
#   #   collection.each do |match_no, values|
#   #     match = Match.by_match_no(match_no).first_or_initialize

#   #     team1 = Team.by_name(values[0]).first
#   #     team2 = Team.by_name(values[1]).first

#   #     next if team1.blank? || team2.blank?

#   #     match.team1_id = team1.id
#   #     match.team2_id = team2.id

#   #     stadium = Stadium.by_name(match_type).first_or_initialize
#   #     stadium.save

#   #     match.stadium_id = stadium.try(:id)
#   #     match.match_date = values[2]

#   #     round = Round.by_name(match_type).first
#   #     match.round_id = round.try(:id)

#   #     match.save
#   #   end
#   # end

#   # # SEMI QUESTIONS.............

#   # desc "Import FIFA SEMI master data"
#   # task fifa_semi_master_data: [:fifa_semi_matches, :fifa_semi_questions,
#   #                               :fifa_semi_match_questions,
#   #                               :fifa_semi_challenges] do
#   #   # for initial run include :questions, :match_questions, :challenges
#   # end

#   # def semi_matches
#   #   {
#   #     61 => ['France', 'Belgium', '2018-07-10 23:30:00'],
#   #     62 => ['Croatia', 'England', '2018-07-11 23:30:00']
#   #   }
#   # end


#   # desc 'Import Semi Matches'
#   # task fifa_semi_matches: :environment do
#   #   import_ko_matches(semi_matches, 'Semi-Final')
#   # end

#   # desc 'Import semi questions'
#   # task fifa_semi_questions: :environment do
#   #   questions = {
#   #     # defaults
#   #     'Who will score first goal for Belgium?' => 2, # Lukaku Hazard DeBruyne Fellaini Others NoGoal

#   #     'Total distance(km) covered by France?' => 2, # 0-80 81-90 91-100 101-110 111-120 120+

#   #     'Total distance(km) covered by Croatia?' => 2
#   #   }
#   #   questions.each do |question, weightage|
#   #     question = Question.by_question(question).first_or_initialize
#   #     question.weightage = weightage
#   #     question.save
#   #   end
#   #   p "Imported Semi Questions..."
#   # end

#   # desc 'Import semi match questions'
#   # task fifa_semi_match_questions: :environment do
#   #   MatchQuestion.add_football_ko_match_questions('semi')
#   #   p "Imported Semi Match Questions..."
#   # end

#   # desc 'Import Semi challenges'
#   # task fifa_semi_challenges: :environment do
#   #   Challenge.add_fifa_challenges('semi')
#   #   p "Imported Semi Challenges..."
#   # end

#   # Import FINAL DATA
#   # desc "Import FIFA FINAL master data"
#   # task fifa_final_master_data: [:fifa_final_matches, :fifa_final_questions,
#   #                               :fifa_final_match_questions,
#   #                               :fifa_final_challenges] do
#   #   # for initial run include :questions, :match_questions, :challenges
#   # end

#   # def l_final_matches
#   #   {
#   #     63 => ['Belgium', 'England', '2018-07-14 19:30:00'],
#   #   }
#   # end

#   # def final_matches
#   #   {
#   #     64 => ['France', 'Croatia', '2018-07-15 20:30:00']
#   #   }
#   # end

#   # desc 'Import LP Matches'
#   # task fifa_final_matches: :environment do
#   #   import_ko_matches(l_final_matches, 'Play-Off for 3rd Place')
#   #   import_ko_matches(final_matches, 'Final')
#   # end

#   # desc 'Import final questions'
#   # task fifa_final_questions: :environment do
#   #   questions = {
#   #     # defaults
#   #     'Who will win 3rd Place?' => 20, # Belgium England No\ Result
#   #     'Total Goals scored by Belgium?' => 5, # 0 1 2 3 4 5 5+
#   #     'Total Goals scored by England?' => 5, # 0 1 2 3 4 5 5+
#   #     'Who will be Budweiser Man of the Match?' => 5,
#   #     'Total no. of tackles in the match?' => 2,
#   #     'Total no. of clearances in the match?' => 2,
#   #     'Total no. of blocks in the match?' => 2,
#   #     'Who will score first goal for Belgium in the match?' => 3, # Lukaku Debruyne Hazard Fellaini Others
#   #     'Total pass accuracy by England in the match?' => 3,

#   #     # --------------------------------------------------------------------

#   #     'Who will win Fifa World Cup 2018?' => 20, # France Croatia No\ Result
#   #     'Total Goals scored by France?' => 5, # 0 1 2 3 4 5 5+
#   #     'Total Goals scored by Croatia?' => 5, # 0 1 2 3 4 5 5+
#   #     'Who will win Golden Ball of the tournament?' => 5, # Hazard Modric Mbappe Kante Griezmann Kane Dyzuba Subasic Others
#   #     'First goal in the match will be from?' => 3,
#   #     'Total no. of balls recovered in the match?' => 2,
#   #     'Total goal attempts in the match?' => 2,
#   #     'Total distance(km) covered by France?' => 2, # 0-80 81-90 91-100 101-110 111-120 121-130 130+
#   #     'Who will score first goal in the Match?' => 3 # Modric Mbappe Umtiti Perisic Griezmann Mandzukic Others
#   #     # Total 50 points
#   #   }
#   #   questions.each do |question, weightage|
#   #     question = Question.by_question(question).first_or_initialize
#   #     question.weightage = weightage
#   #     question.save
#   #   end
#   #   p "Imported Final Questions..."
#   # end

#   # desc 'Import Final match questions'
#   # task fifa_final_match_questions: :environment do
#   #   MatchQuestion.add_football_ko_match_questions('lf')
#   #   MatchQuestion.add_football_ko_match_questions('final')
#   #   p "Imported Final Match Questions..."
#   # end

#   # desc 'Import Final challenges'
#   # task fifa_final_challenges: :environment do
#   #   Challenge.add_fifa_challenges('finals')
#   #   p "Imported Final Challenges..."
#   # end
# end

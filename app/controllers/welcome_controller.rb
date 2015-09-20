class WelcomeController < ApplicationController
    def index

        @users=User.find_by_sql("select user_id, user_name, count(*) as cnt from answers left join corrects using (stage) left join users on answers.user_id = users.id  where answer = correct group by user_id, user_name order by cnt desc;")
        ans=Answer.find_by_sql("select stage, answer ,count(*) as cnt from answers group by stage, answer order by stage ,answer;")
        @answers=Array.new(Answer.maximum('stage'))
        @answers.length.times do |i|
            @answers[i]=Hash.new
        end
        ans.each do |answer|
           @answers[answer.stage - 1][answer.answer]=answer.cnt
        end
    end
end


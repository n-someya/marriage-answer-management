class WelcomeController < ApplicationController
    def index

        @users=User.find_by_sql("select user_id, user_name, count(*) as cnt , rank() over ( order by count(*) desc ) from answers left join corrects using (stage) left join users on answers.user_id = users.id  where answer = correct group by user_id, user_name order by cnt desc;")
        ans=Answer.find_by_sql("select stage, answer ,count(*) as cnt from answers group by stage, answer order by stage ,answer;")
        max=Answer.maximum('stage')
        if max == nil
            max=0
        end
        @answers=Array.new(max)
        @answers.length.times do |i|
            @answers[i]=Hash.new
        end
        p ans
        ans.each do |answer|
           @answers[answer.stage - 1][answer.answer]=answer.cnt
        end
    end
end


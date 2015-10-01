require 'net/http'
require 'csv'
class ResetController < ApplicationController
    def index
    end
    def delete
        Correct.destroy_all()
        Answer.destroy_all()
        User.update_all(used: 'f')
        data={}
        data["key"]="mwmns"
        data["gameid"]=Time.now.strftime("%d%H%M%S")
        CSV.foreach('config/applications.csv') do |row|
            res= Net::HTTP.post_form(URI.parse(row[0]), data)
            p res
        end
        redirect_to controller: 'welcome', action: 'index'
    end
end



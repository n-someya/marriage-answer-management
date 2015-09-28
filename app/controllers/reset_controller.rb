require 'net/http'
class ResetController < ApplicationController
    def index
    end
    def delete
        Correct.destroy_all()
        Answer.destroy_all()
        Users.update_all(used: 'f')
        CSV.foreach('config/applications.csv') do |row|
            uri=URI(row)
            http = Net::HTTP.new(uri.host, uri.port)
            data = URI.encode_www_form(data) 
            http.start {|h|
                h.post(uri.request_uri, data, header)
            }
        end
    end
end



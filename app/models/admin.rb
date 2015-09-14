class Admin < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
    def gravatar_url(*args)
        options = args.extract_options!
        length = options.delete(:length) || 130
        hash = Digest::MD5.hexdigest(email.downcase)
        "http://gravatar.com/avatar/#{hash}.jpg?s=#{length}"
    end

end

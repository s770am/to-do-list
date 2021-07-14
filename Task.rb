gem 'activerecord' , '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: "todolist.sqlite3") 

class Task < ActiveRecord::Base

    field :desciption, as: :text
    field :importance, as: :integer

end

Task.auto_upgrade!

at_exit do
    ActiveRecord::Base.connection.close
end

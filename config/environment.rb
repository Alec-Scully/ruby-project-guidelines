require 'bundler'
require 'tty-prompt'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_rel '../lib'
require_rel '../bin'

ActiveRecord::Base.logger = nil
# config.active_record.logger = nil
# ActiveRecord::Base.logger = 1
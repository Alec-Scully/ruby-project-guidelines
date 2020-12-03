require 'bundler'
require 'tty-prompt'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_rel '../lib'

ActiveRecord::Base.logger = nil
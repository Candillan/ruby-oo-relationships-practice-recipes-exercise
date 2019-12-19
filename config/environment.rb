require 'active_record'

require 'bundler'
require 'bundler/setup'
Bundler.require
require_all 'app'

DB = ActiveRecord::Base.establish_connection({
    adapter: 'sqlite3',
    database: 'db/recipes.db'
})

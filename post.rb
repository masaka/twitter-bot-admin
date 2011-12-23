#!/usr/local/bin/ruby -Ku
# encoding: utf-8

require "rubygems"
require "active_record"
require "rubytter"
require "oauth"


ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => "[your_sqlite3_database_file]",
  :timeout  => 5000
)


consumer = OAuth::Consumer.new(
  "[your_]",
  "[your_]",
  :site => 'http://twitter.com'
  )

token = OAuth::AccessToken.new(
  consumer,
  '[your_]',
  '[your_]'
  )

client = OAuthRubytter.new(token)

# tweets テーブルにアクセスするためのクラスを宣言
class Tweet < ActiveRecord::Base
end

# 全てのレコードについてループ
array=[]
Tweet.find(:all).each { |tw|
  array<< tw.title
}

str_update = "#{array[rand(array.size)]}"
client.update(str_update)


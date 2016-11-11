require 'twitter'
require 'pry'
require 'pp'

class TwitterService

	def client
		client = Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV['TWITTER_ID']
			config.consumer_secret     = ENV['TWITTER_SECRET']
			config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
			config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
		end
	end

	def send_beats
		results = []
		client.search("send beats").take(100).each do |tweet|
			
			if 30000 <= tweet.user.followers_count.to_i
				results << {created_at:tweet.created_at.strftime("%A, %d %b %Y %l:%M %p"),
					text:tweet.text.gsub("\n",""),
					username:tweet.user.screen_name,
					followers:tweet.user.followers_count,
					image:tweet.user.profile_image_url,
					url:tweet.url}
			end
		end
		return results.uniq
	end

	def music_producer
		results = []
		client.search("music producer").take(100).each do |tweet|
			
			if 30000 <= tweet.user.followers_count.to_i
				results << {created_at:tweet.created_at.strftime("%A, %d %b %Y %l:%M %p"),
					text:tweet.text.gsub("\n",""),
					username:tweet.user.screen_name,
					followers:tweet.user.followers_count,
					image:tweet.user.profile_image_url,
					url:tweet.url}
			end
		end
		return results.uniq
	end

	def a_n_r
		results = []
		client.search("a&r").take(100).each do |tweet|
			
			if 30000 <= tweet.user.followers_count.to_i
				results << {created_at:tweet.created_at.strftime("%A, %d %b %Y %l:%M %p"),
					text:tweet.text.gsub("\n",""),
					username:tweet.user.screen_name,
					followers:tweet.user.followers_count,
					image:tweet.user.profile_image_url,
					url:tweet.url}
			end
		end
		return results.uniq
	end

end

twitter = TwitterService.new

twitter.send_beats

# pp "created at:#{tweet.created_at.strftime("%A, %d %b %Y %l:%M %p")}"
# 				pp "#{tweet.text.gsub("\n","")}"
# 				pp "Username: #{tweet.user.screen_name}"
# 				pp "Followers: #{tweet.user.followers_count}"

# created_at
# text
# user.screen_name
# user.followers_count


# {:created_at=>"Mon Nov 07 06:22:02 +0000 2016",
#  :id=>795511610374664192,
#  :id_str=>"795511610374664192",
#  :text=>
#   "Working on a new album, \n\nSend beats and instrumentals to: omenxiiimusic@gmail.com",
#  :truncated=>false,
#  :entities=>{:hashtags=>[], :symbols=>[], :user_mentions=>[], :urls=>[]},
#  :metadata=>{:iso_language_code=>"en", :result_type=>"recent"},
#  :source=>
#   "<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>",
#  :in_reply_to_status_id=>nil,
#  :in_reply_to_status_id_str=>nil,
#  :in_reply_to_user_id=>nil,
#  :in_reply_to_user_id_str=>nil,
#  :in_reply_to_screen_name=>nil,
#  :user=>
#   {:id=>2934399968,
#    :id_str=>"2934399968",
#    :name=>"_OmenXIII",
#    :screen_name=>"omenxiii",
#    :location=>"",
#    :description=>
#     "What's it worth, to you? _Blnk  omenxiiimusic@gmail.com  lease beats for $10 or less: https://t.co/5PZeExNIAi",
#    :url=>"https://t.co/X4GM0UPWD6",
#    :entities=>
#     {:url=>
#       {:urls=>
#         [{:url=>"https://t.co/X4GM0UPWD6",
#           :expanded_url=>"https://soundcloud.com/omenxiii",
#           :display_url=>"soundcloud.com/omenxiii",
#           :indices=>[0, 23]}]},
#      :description=>
#       {:urls=>
#         [{:url=>"https://t.co/5PZeExNIAi",
#           :expanded_url=>"http://traktrain.com/omenxiii",
#           :display_url=>"traktrain.com/omenxiii",
#           :indices=>[86, 109]}]}},
#    :protected=>false,
#    :followers_count=>3399,
#    :friends_count=>100,
#    :listed_count=>4,
#    :created_at=>"Thu Dec 18 06:40:43 +0000 2014",
#    :favourites_count=>5464,
#    :utc_offset=>-28800,
#    :time_zone=>"Pacific Time (US & Canada)",
#    :geo_enabled=>false,
#    :verified=>false,
#    :statuses_count=>2951,
#    :lang=>"en",
#    :contributors_enabled=>false,
#    :is_translator=>false,
#    :is_translation_enabled=>false,
#    :profile_background_color=>"C0DEED",
#    :profile_background_image_url=>
#     "http://abs.twimg.com/images/themes/theme1/bg.png",
#    :profile_background_image_url_https=>
#     "https://abs.twimg.com/images/themes/theme1/bg.png",
#    :profile_background_tile=>false,
#    :profile_image_url=>
#     "http://pbs.twimg.com/profile_images/792529011750481920/dJx2LQVk_normal.jpg",
#    :profile_image_url_https=>
#     "https://pbs.twimg.com/profile_images/792529011750481920/dJx2LQVk_normal.jpg",
#    :profile_banner_url=>
#     "https://pbs.twimg.com/profile_banners/2934399968/1475172059",
#    :profile_link_color=>"1DA1F2",
#    :profile_sidebar_border_color=>"C0DEED",
#    :profile_sidebar_fill_color=>"DDEEF6",
#    :profile_text_color=>"333333",
#    :profile_use_background_image=>true,
#    :has_extended_profile=>false,
#    :default_profile=>true,
#    :default_profile_image=>false,
#    :following=>false,
#    :follow_request_sent=>false,
#    :notifications=>false,
#    :translator_type=>"none"},
#  :geo=>nil,
#  :coordinates=>nil,
#  :place=>nil,
#  :contributors=>nil,
#  :is_quote_status=>false,
#  :retweet_count=>0,
#  :favorite_count=>6,
#  :favorited=>false,
#  :retweeted=>false,
#  :lang=>"en"}
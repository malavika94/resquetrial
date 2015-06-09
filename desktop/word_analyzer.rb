class WordAnalyzer
  @queue = "facebook_posts"
  
  def self.perform(word)
    puts "Latest post: #{word}"
    sleep 3
    puts "Finished with analysis on #{word}"
    end

endß
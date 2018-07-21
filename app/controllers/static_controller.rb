class StaticController < ApplicationController

  skip_before_action :verify_authenticity_token

  def droper

  end

  def upload

    words = get_five_common(request.body.read)

    render :json => words
  end


  private
    def get_five_common(text)
      counts = {}
      words = text.split(' ')

      words.uniq.each do |word|
        counts[word] = 0
      end

      words.each do |word|
        counts[word] = text.scan(word).count
      end

      s = counts.sort_by {|_key, value| value}

      top_five = []
      s.reverse.each_with_index {|element, index|
        top_five.push(element[0])
        break if index ==  4;
      }

      return top_five
    end

end

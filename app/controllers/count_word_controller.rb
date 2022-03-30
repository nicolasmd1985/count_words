class CountWordController < ApplicationController

  def index
  end


  def method_count

    sentence = params[:sentence]
    result = []
    if sentence.class == Array || sentence.class == String
      if sentence.class == Array
        # result = sentence.join('').gsub(/\d+/, "").split.map{|x| ["word: #{x} size: #{x.size}"]}
        sentence.map{|x| x.gsub(/\d+/, "").gsub(/[^a-zA-Z ]/,'')}.each do |se|
          result << se.split.each_with_index.map{ |x,y|  ["{word: #{x} , count: #{y+1}, ocurrency: #{se.scan(x).count}}"]}
        end
      else
        clean_sentence = sentence.gsub(/\d+/, "").gsub(/[^a-zA-Z ]/,'')
        result = clean_sentence.split.each_with_index.map{|x,y| ["{word: #{x} , count: #{y+1}, ocurrency: #{clean_sentence.scan(x).count}}"]}
        # result= sentence.tr("0-9", "").split.map{|x| [x ,x.size]}
      end
    end
    respond_to do |format|
      format.json{ render :json => result, root: false }
    end
  end

end

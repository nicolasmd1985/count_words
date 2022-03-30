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
          result << se.split.each_with_index.map{ |x,y|  ["{word: #{x} , count: #{y+1}}"]}
        end
      else
        result = sentence.gsub(/\d+/, "").gsub(/[^a-zA-Z ]/,'').split.each_with_index.map{|x,y| ["{word: #{x} , count: #{y+1}}"]}
        # result= sentence.tr("0-9", "").split.map{|x| [x ,x.size]}
      end
    end
    respond_to do |format|
      format.json{ render :json => result, root: false }
    end
  end

end

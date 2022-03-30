class CountWordController < ApplicationController

  def index
  end


  def method_count

    sentence = params[:sentence]
    result = []
    if sentence.class == Array || sentence.class == String
      if sentence.class == Array
        # result = sentence.join('').gsub(/\d+/, "").split.map{|x| ["word: #{x} size: #{x.size}"]}
        sentence.map{|x| x.gsub(/\d+/, "")}.each do |se|
          result << se.split.map{|x| ["word: #{x} , size: #{x.size}"]}
        end
      else
        result = sentence.gsub(/\d+/, "").split.map{|x| ["word: #{x} , size: #{x.size}"]}
        # result= sentence.tr("0-9", "").split.map{|x| [x ,x.size]}
      end
    end
    respond_to do |format|
      format.json{ render :json => result, root: false }
    end
  end

end

class KaigyoController < ApplicationController
  def index
    if request.patch? then
      @title = '改行しました。'
      obj = Text.find(1)
      obj.update(text_params)                 # いちど更新
      obj = Text.find(1)                      # 取得
      edited = edit(obj.before)               # 改行編集
      obj.update(before: ' ', aftere: edited) #更新
      @text = Text.find(1)                    # 取得
    else
      sample_bef = "【Sample】\n≪1月26日（金）に受理した事件≫ ○その他/XXX窃盗：架空市内1件/XX盗：架空市、架空の市3件/XXあり、なし ≪1月27日（土）に受理した事件≫ ○窃盗（XXX盗）XX1件/架空市内のXXXのXXXが盗まれる被害が発生しています。○その他/XXX盗（XX）：架空の市、架空市2件"
      sample_aft = "【Sample】\n≪1月26日（金）に受理した事件≫ \n　○その他/XXX窃盗：架空市内1件/XX盗：架空市、架空の市3件/XXあり、なし \n\n≪1月27日（土）に受理した事件≫ \n　○窃盗（XXX盗）XX1件/架空市内のXXXのXXXが盗まれる被害が発生しています。\n　○その他/XXX盗（XX）：架空の市、架空市2件"
      obj = Text.find(1)
      obj.update(before: sample_bef, aftere: sample_aft)
      @text = Text.find(1)  
    end
  end

  private
  # 改行編集
  def edit(str)
    result = ""
    str.each_line do |line|
      line.encode!("UTF-8")
      line.gsub!(/≪/, "\n\n≪")
      line.gsub!(/○/, "\n　○")
      result += line
    end
    return result
  end

  private
  def text_params
    params.require(:text).permit(:before, :aftere) 
  end

end

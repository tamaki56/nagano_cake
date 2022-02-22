class Public::HomesController < ApplicationController
  def top
    @items = Item.where(is_active: true).order(id: "DESC")#id降順
  end

  def about
  end
end

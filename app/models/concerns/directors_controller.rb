class DirectorsController < ApplicationController
  
  def index
    render({:template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id})
    @the_director = matching_records.at(0)

    render({:template => "director_templates/details"})
  end

  def youngest
    director_list = Director.where.not({ :dob => nil }) 
    order_directors = director_list.all.order({:dob => :desc}) 
    @youngest = order_directors.at(0)

    
    render({:template => "director_templates/young"})
  end

  def eldest
    director_list = Director.where.not({ :dob => nil })
    order_directors = director_list.all.order({:dob => :asc})
    @oldest = order_directors.at(0)
    
    render({ :template => "director_templates/eldest"})
  end

end

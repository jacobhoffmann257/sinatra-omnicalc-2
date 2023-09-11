require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do
  redirect("/add")
end

get("/add") do
  
  erb(:add_form)

end

get("/wizard_add") do
  @first_num = params.fetch("first_number").to_f
  @second_num = params.fetch("second_number").to_f
  @result = @first_num + @second_num
  erb(:add_result)
end

get("/subtract") do
  erb(:subtraction_form)
end

get("/wizard_subtract") do
  @first_num = params.fetch("first_numb").to_f
  @second_num = params.fetch("second_numb").to_f
  @result = @first_num - @second_num
  erb(:sub_result)
end

get("/multiply") do
  erb(:mult_form)
end

get("/wizard_multiply") do
  @first_number = params.fetch("first_num").to_f
  @second_num = params.fetch("second_num").to_f
  @result = @first_number * @second_num
  erb(:mult_result)
end

get("/divide") do
  erb(:divform)
end

get("/wizard_divide") do
  @numerator = params.fetch("first_number").to_f 
  @demonator = params.fetch("second_num").to_f
  @result = @numerator / @demonator
  erb(:div_result)
end

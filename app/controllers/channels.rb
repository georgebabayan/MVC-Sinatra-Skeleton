get '/channels' do
  erb :'channels/index'
end

get '/channels/:id' do
  @user = current_user
  @channel = Channel.find(params[:id])
  if @user
    @subscription = (Subscription.where(user_id: @user.id, channel_id: @channel.id)).first
  end
  erb :'channels/index'
end

post '/channels/:id' do
  @user = current_user
  @channel = Channel.find(params[:id])
  Subscription.create(user_id: @user.id, channel_id: @channel.id)
  redirect "/users/#{current_user.id}"
end

delete '/channels/:id' do
  @user = current_user
  @channel = Channel.find(params[:id])
  @subscription = (Subscription.where(user_id: @user.id, channel_id: @channel.id)).first
  @subscription.destroy
  redirect "/users/#{current_user.id}"
end

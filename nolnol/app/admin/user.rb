ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
 permit_params do
   permitted = [:permitted, :user_name,:admin,:user_gender,:user_state,:ususer_age,:email,:image]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
 end
 filter :created_at
end

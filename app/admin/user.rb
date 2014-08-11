ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  actions :index
  index do
    column :id
    column :email
    column :name do |user|
      "#{user.first_name} #{user.last_name}"
    end

    column :phone
    column :city
    column :address
  end

end

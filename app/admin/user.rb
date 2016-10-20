ActiveAdmin.register User do
  menu priority: 0, label: proc{ I18n.t("active_admin.user_index") }

  permit_params :name, :surname, :email, car_attributes: [:id, :make, :model, :engine, :registration_no, :vin,
                                                           :actual_mileage, :yearly_mileage, :driving_profile]

  index do
    selectable_column
    id_column
    column :name
    column :surname
    column :email
    column :created_at
    actions
  end

  filter :name
  filter :surname
  filter :email
  filter :created_at

  show do
    attributes_table do
      row :name
      row :surname
      row :email
      row :created_at
      row :updated_at
      panel "Car" do
        table_for user.car do
          column :make
          column :model
          column :engine
          column :registration_no
          column :vin
          column :actual_mileage
          column :yearly_mileage
          column :driving_profile
        end
      end
    end
  end

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :surname
      f.input :email

      f.has_many :car do |car|
        car.input :make
        car.input :model
        car.input :engine
        car.input :registration_no
        car.input :vin
        car.input :actual_mileage
        car.input :yearly_mileage
        car.input :driving_profile, as: :select2, collection: Car.driving_profiles.keys
      end
    end
    f.actions
  end
end

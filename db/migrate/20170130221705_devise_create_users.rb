class DeviseCreateUsers < ActiveRecord::Migration
  # TODO remigrate this model than remove this todo
  def change
    create_table :users do |t|
      t.references :university, index: true
      t.boolean    :ruairi, default: false
      t.boolean    :alexina, default: false
      t.boolean    :mari, default: false
      t.boolean    :tarlach, default: false
      t.boolean    :oauth_pass_set,          default: true
      t.string     :username
      t.string     :oauth_token
      t.string     :oauth_expires_at
      t.string     :provider
      t.string     :uid
      t.string     :type
      t.string     :phone
      t.string     :email,                   null: false, default: ""
      t.string     :encrypted_password,      null: false, default: ""
      t.string     :reset_password_token
      t.datetime   :reset_password_sent_at
      t.datetime   :remember_created_at
      t.integer    :sign_in_count,           default: 0, null: false
      t.datetime   :current_sign_in_at
      t.datetime   :last_sign_in_at
      t.inet       :current_sign_in_ip
      t.inet       :last_sign_in_ip
      t.string     :confirmation_token
      t.datetime   :confirmed_at
      t.datetime   :confirmation_sent_at
      t.string     :unconfirmed_email
      t.string     :invitation_token
      t.datetime   :invitation_created_at
      t.datetime   :invitation_sent_at
      t.datetime   :invitation_accepted_at
      t.integer    :invitation_limit
      t.references :invited_by, polymorphic: true
      t.integer    :invitations_count, default: 0
      t.index      :invitations_count
      t.index      :invitation_token, unique: true # for invitable
      t.index      :invited_by_id
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
  end
end

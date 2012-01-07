class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    # Clean last migration
    execute <<-SQL
      ALTER TABLE talks DROP CONSTRAINT fk_talks_users_talker_id;
      ALTER TABLE talks DROP CONSTRAINT fk_talks_users_created_by_id;
      ALTER TABLE talks DROP CONSTRAINT fk_talks_users_updated_by_id;
    SQL
    drop_table :users_fakes
    drop_table :users_twitters
    drop_table :users

    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable
      t.timestamps

      t.integer :role_id
      t.string :name
      t.string :twitter_handle, unique: true
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true

    execute <<-SQL
      ALTER TABLE users
        ADD CONSTRAINT fk_users_roles_id
        FOREIGN KEY (role_id)
        REFERENCES roles(id);

      ALTER TABLE talks
        ADD CONSTRAINT fk_talks_users_created_by_id
        FOREIGN KEY (created_by_id)
        REFERENCES users(id);

      ALTER TABLE talks
        ADD CONSTRAINT fk_talks_users_updated_by_id
        FOREIGN KEY (updated_by_id)
        REFERENCES users(id);

      ALTER TABLE talks
        ADD CONSTRAINT fk_talks_users_talker_id
        FOREIGN KEY (talker_id)
        REFERENCES users(id);
    SQL
  end

  def self.down
    execute <<-SQL
      ALTER TABLE talks DROP CONSTRAINT fk_talks_users_talker_id;
      ALTER TABLE talks DROP CONSTRAINT fk_talks_users_created_by_id;
      ALTER TABLE talks DROP CONSTRAINT fk_talks_users_updated_by_id;
    SQL

    drop_table :users
  end

end

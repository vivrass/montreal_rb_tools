class CreateDatabase < ActiveRecord::Migration
  def up
    create_table :roles do |t|
      t.string :name
    end

    execute <<-SQL
      INSERT INTO roles (name) VALUES ('admin');
      INSERT INTO roles (name) VALUES ('user');
    SQL

    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :role_id

      t.timestamps
    end

    create_table :users_fakes do |t|
      t.integer    :id
      t.string     :picture_url

      t.timestamps
    end

    create_table :users_twitters do |t|
      t.integer    :id
      t.string     :screen_name
      t.string     :picture_url
      t.integer    :twitter_id
      t.string     :oauth_token
      t.string     :oauth_token_secret

      t.timestamps
    end

    execute <<-SQL
      ALTER TABLE users
        ADD CONSTRAINT fk_users_roles
        FOREIGN KEY (role_id)
        REFERENCES roles(id);

      ALTER TABLE users_fakes
        ADD CONSTRAINT fk_users_fakes_users
        FOREIGN KEY (id)
        REFERENCES users(id);

      ALTER TABLE users_twitters
        ADD CONSTRAINT fk_users_twitters_users
        FOREIGN KEY (id)
        REFERENCES users(id);
    SQL

    create_table :talks do |t|
      t.integer :talker_id
      t.string  :title
      t.text    :description
      t.integer :created_by_id
      t.integer :updated_by_id

      t.timestamps
    end

    execute <<-SQL
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

  def down
    execute <<-SQL
      ALTER TABLE users          DROP CONSTRAINT fk_users_roles;
      ALTER TABLE users_fakes    DROP CONSTRAINT fk_users_fakes_users;
      ALTER TABLE users_twitters DROP CONSTRAINT fk_users_twitters_users;

      ALTER TABLE talks DROP CONSTRAINT fk_talks_users_talker_id;
      ALTER TABLE talks DROP CONSTRAINT fk_talks_users_created_by_id;
      ALTER TABLE talks DROP CONSTRAINT fk_talks_users_updated_by_id;
    SQL


    drop_table :talks
    drop_table :users_twitters
    drop_table :users_fakes
    drop_table :users
    drop_table :roles
  end
end

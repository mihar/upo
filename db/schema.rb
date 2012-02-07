# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090419232650) do

  create_table "abouts", :force => true do |t|
    t.text   "about"
    t.string "image"
    t.text   "summary"
  end

  create_table "activities", :force => true do |t|
    t.text    "activities"
    t.integer "union_id"
    t.integer "subunion_id"
  end

  create_table "actualities", :force => true do |t|
    t.string  "title"
    t.date    "date"
    t.text    "text"
    t.string  "image"
    t.boolean "show_zdus"
    t.boolean "show_pz"
    t.boolean "show_du"
    t.date    "show_from"
    t.date    "show_until"
    t.integer "union_id"
    t.integer "subunion_id"
    t.text    "summary"
  end

  create_table "admins", :force => true do |t|
    t.string  "name"
    t.string  "surname"
    t.string  "username"
    t.string  "password"
    t.integer "union_id"
    t.boolean "haxor"
    t.string  "email"
    t.boolean "zdus"
    t.integer "subunion_id"
  end

  create_table "albums", :force => true do |t|
    t.string  "title"
    t.date    "date_taken"
    t.integer "union_id"
    t.text    "description"
    t.integer "subunion_id"
    t.integer "photos_count", :default => 0
  end

  create_table "categories", :force => true do |t|
    t.string  "title"
    t.integer "resource_categories_count", :default => 0
    t.boolean "standalone",                :default => false
    t.integer "position"
  end

  create_table "counters", :force => true do |t|
    t.integer "count",       :default => 0
    t.integer "union_id"
    t.integer "subunion_id"
  end

  create_table "departments", :force => true do |t|
    t.string  "title"
    t.integer "union_id"
    t.integer "subunion_id"
    t.integer "position"
    t.text    "description"
  end

  create_table "forms", :force => true do |t|
    t.string "title"
    t.string "file"
  end

  create_table "information", :force => true do |t|
    t.string  "title"
    t.string  "address"
    t.string  "post"
    t.integer "post_id"
    t.string  "phone"
    t.string  "fax"
    t.string  "web"
    t.string  "email"
    t.string  "vatid"
    t.boolean "tax"
    t.string  "office_hours"
    t.string  "maticna_stevilka"
    t.string  "trr"
    t.text    "summary"
    t.text    "about"
    t.string  "image"
    t.string  "email_contact"
    t.string  "email_contact_copy"
  end

  create_table "informers", :force => true do |t|
    t.string "title"
    t.string "url"
  end

  create_table "izdelas", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.text     "summary"
    t.text     "text"
    t.string   "image"
    t.integer  "union_id"
    t.integer  "subunion_id"
  end

  create_table "links", :force => true do |t|
    t.string  "title"
    t.string  "description"
    t.string  "url"
    t.integer "union_id"
    t.integer "subunion_id"
    t.integer "position",    :default => 0
  end

  create_table "logged_exceptions", :force => true do |t|
    t.string   "exception_class"
    t.string   "controller_name"
    t.string   "action_name"
    t.text     "message"
    t.text     "backtrace"
    t.text     "environment"
    t.text     "request"
    t.datetime "created_at"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.text     "text"
    t.integer  "union_id"
    t.integer  "subunion_id"
    t.text     "summary"
    t.string   "author"
    t.boolean  "show_zdus"
    t.boolean  "show_pz"
    t.boolean  "show_du"
    t.datetime "show_from"
    t.datetime "show_until"
    t.string   "news_type"
  end

  create_table "news_files", :force => true do |t|
    t.integer  "union_id"
    t.integer  "subunion_id"
    t.string   "fileimage"
    t.string   "filedata"
    t.integer  "news_id"
    t.integer  "actuality_id"
    t.integer  "public_relation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "izdela_id"
  end

  create_table "organizations", :force => true do |t|
    t.text     "organization"
    t.integer  "union_id"
    t.integer  "subunion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "position",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "menu_title"
  end

  create_table "people", :force => true do |t|
    t.string  "name"
    t.integer "union_id"
    t.string  "telephone"
    t.string  "fax"
    t.string  "email"
    t.string  "function"
    t.string  "extra"
    t.string  "image"
    t.integer "department_id"
    t.string  "address"
    t.integer "post_id"
    t.string  "post"
    t.string  "mobile"
    t.integer "subunion_id"
    t.integer "position"
  end

  create_table "photos", :force => true do |t|
    t.string  "filename"
    t.integer "album_id"
    t.string  "title"
    t.text    "description"
    t.string  "author"
    t.date    "date"
  end

  create_table "postal_numbers", :force => true do |t|
    t.integer "postal_code"
    t.string  "city"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "manager"
    t.text     "text"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",   :default => 0
    t.integer  "union_id"
  end

  create_table "public_relations", :force => true do |t|
    t.string  "title"
    t.date    "created_at"
    t.text    "statement"
    t.string  "author"
    t.integer "union_id",    :default => 0
    t.integer "subunion_id", :default => 0
    t.text    "summary"
    t.string  "image"
  end

  create_table "recreations", :force => true do |t|
    t.string  "title"
    t.string  "leader"
    t.string  "address"
    t.integer "post_id"
    t.string  "post"
    t.string  "phone"
    t.string  "mobile"
    t.text    "description"
    t.integer "union_id"
    t.integer "subunion_id"
  end

  create_table "resource_attachments", :force => true do |t|
    t.string  "title"
    t.string  "fileimage"
    t.string  "filedata"
    t.string  "link"
    t.integer "resource_id"
    t.string  "google_video"
    t.integer "project_id"
    t.integer "department_id"
    t.integer "activities_id"
    t.integer "subsection_id"
    t.integer "organization_id"
    t.integer "resource_category_id"
    t.integer "page_id"
    t.text    "summary"
  end

  create_table "resource_categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "resources_count", :default => 0
    t.integer  "category_id"
    t.integer  "position",        :default => 0
    t.text     "description"
    t.string   "menu_title"
  end

  create_table "resources", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "author"
    t.integer  "union_id"
    t.integer  "subunion_id"
    t.integer  "resource_attachments_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "summary"
    t.integer  "resource_category_id"
    t.integer  "category_id"
  end

  create_table "rules", :force => true do |t|
    t.text    "rules"
    t.integer "union_id"
    t.integer "subunion_id"
  end

  create_table "sponsors", :force => true do |t|
    t.string  "title"
    t.integer "union_id"
    t.integer "subunion_id"
  end

  create_table "subsections", :force => true do |t|
    t.string  "title"
    t.string  "manager"
    t.string  "working_hours"
    t.text    "description"
    t.integer "union_id"
    t.integer "subunion_id"
  end

  create_table "subunions", :force => true do |t|
    t.string  "title"
    t.string  "address"
    t.integer "postal_number"
    t.string  "telephone"
    t.string  "president"
    t.string  "email",              :limit => 64
    t.string  "logo"
    t.string  "working_hours"
    t.string  "locality"
    t.string  "contact"
    t.text    "description"
    t.string  "permalink"
    t.string  "image"
    t.string  "www"
    t.text    "summary"
    t.string  "title_websafe"
    t.string  "email_contact"
    t.string  "email_contact_copy"
  end

  create_table "symbolics", :force => true do |t|
    t.string  "title"
    t.string  "image"
    t.text    "description"
    t.integer "union_id"
    t.integer "subunion_id"
  end

  create_table "unions", :force => true do |t|
    t.string  "title"
    t.string  "working_hours"
    t.string  "address"
    t.string  "locality"
    t.integer "postal_number"
    t.string  "telephone"
    t.string  "email"
    t.text    "description"
    t.string  "contact",            :limit => 128
    t.string  "logo"
    t.string  "president"
    t.integer "subunion_id"
    t.string  "permalink"
    t.string  "image"
    t.string  "www"
    t.text    "summary"
    t.string  "title_websafe"
    t.string  "email_contact"
    t.string  "email_contact_copy"
  end

  create_table "universities", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.string   "websafe_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visits", :force => true do |t|
    t.string   "ip",            :limit => 50,  :default => "", :null => false
    t.datetime "created_on",                                   :null => false
    t.string   "browser_agent", :limit => 100, :default => "", :null => false
    t.string   "resource",      :limit => 30
    t.integer  "union_id"
    t.integer  "subunion_id"
  end

  create_table "visits_of_events", :force => true do |t|
    t.text    "description"
    t.integer "union_id"
    t.integer "subunion_id"
  end

end

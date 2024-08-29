# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_07_190507) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_roles", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.bigint "role_id", null: false
    t.index ["admin_id"], name: "index_admin_roles_on_admin_id"
    t.index ["role_id"], name: "index_admin_roles_on_role_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "app_images", force: :cascade do |t|
    t.string "image"
    t.string "description"
    t.string "location"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "section"
  end

  create_table "banners", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "campus_drives", force: :cascade do |t|
    t.datetime "registration_from", precision: nil, null: false
    t.datetime "registration_till", precision: nil, null: false
    t.datetime "held_on", precision: nil, null: false
    t.string "title", null: false
    t.text "description"
    t.string "place"
    t.text "registration_link"
    t.text "test_start_link"
    t.string "drive_type", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "candidate_experiences", force: :cascade do |t|
    t.string "candidate_id"
    t.string "job_position"
    t.string "organization"
    t.string "experience_in"
    t.datetime "from_date", precision: nil
    t.datetime "end_date", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "candidate_qualifications", force: :cascade do |t|
    t.integer "candidate_id"
    t.string "college_name"
    t.integer "year_of_passing"
    t.string "department_or_course"
    t.string "cgpa_or_percentage"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.string "resume"
    t.string "position"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "status", default: "Pending"
    t.string "contact_number"
    t.string "subject"
    t.string "qualification"
    t.integer "qualification_year"
    t.string "skills"
    t.boolean "is_experienced", default: false
    t.date "date_of_birth"
    t.string "login_token"
    t.string "source"
  end

  create_table "case_studies", force: :cascade do |t|
    t.bigint "project_id"
    t.text "introduction"
    t.text "objective"
    t.text "solution"
    t.text "challenge"
    t.text "technolgy"
    t.text "result"
    t.text "conclusion"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "publish_on", default: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "case_study_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["case_study_id"], name: "index_challenges_on_case_study_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "contact_us", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "form_type"
    t.text "message"
    t.json "documents"
    t.string "phone_number"
    t.text "project_description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "status", default: "Not Replied"
    t.string "subject"
    t.string "resume"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "designations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.string "designation"
    t.string "image"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "domains", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "category"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "drive_papers", force: :cascade do |t|
    t.bigint "drive_id"
    t.bigint "paper_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "position", default: 0
    t.index ["drive_id"], name: "index_drive_papers_on_drive_id"
    t.index ["paper_id"], name: "index_drive_papers_on_paper_id"
  end

  create_table "drives", force: :cascade do |t|
    t.datetime "registration_from", precision: nil, null: false
    t.datetime "registration_till", precision: nil, null: false
    t.datetime "held_on", precision: nil, null: false
    t.string "title", null: false
    t.text "description"
    t.string "place"
    t.string "drive_type", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "campus_token"
    t.string "campus_drive_type"
    t.boolean "freshers", default: false
    t.boolean "experienced", default: false
    t.boolean "allow_login", default: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "place"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "facility_type"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "global_settings", force: :cascade do |t|
    t.string "category"
    t.string "key"
    t.text "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "section"
  end

  create_table "hiring_rounds", force: :cascade do |t|
    t.bigint "round_id"
    t.integer "position"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "start_time", precision: nil
    t.bigint "hiring_round_id"
    t.string "hiring_round_type"
    t.index ["round_id"], name: "index_hiring_rounds_on_round_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "image"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.boolean "show_on_website", default: true
    t.boolean "mark_as_banner", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.string "registration_id"
    t.integer "application_for_id"
    t.string "application_for_type"
    t.integer "candidate_id"
    t.integer "total_experience", default: 0
    t.decimal "current_ctc"
    t.decimal "expected_ctc"
    t.string "status", default: "Not Appeared"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "login_count", default: 0
    t.string "encrypted_password", default: "", null: false
    t.string "unique_session_id"
  end

  create_table "job_designations", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "designation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["designation_id"], name: "index_job_designations_on_designation_id"
    t.index ["job_id"], name: "index_job_designations_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title", null: false
    t.string "designation", null: false
    t.decimal "min_experience", null: false
    t.decimal "max_experience", null: false
    t.string "required_skills", null: false
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "job_type"
    t.text "responsiblities"
    t.string "campus_token"
    t.boolean "publish_on"
    t.text "benefits"
  end

  create_table "options", force: :cascade do |t|
    t.integer "question_id"
    t.text "description", null: false
    t.boolean "correct_option", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "paper_ques_responses", force: :cascade do |t|
    t.text "response"
    t.integer "option_id"
    t.integer "round_paper_id"
    t.bigint "round_paper_response_id"
    t.bigint "round_attempt_id"
    t.bigint "job_application_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "question_id"
    t.index ["job_application_id"], name: "index_paper_ques_responses_on_job_application_id"
    t.index ["question_id"], name: "index_paper_ques_responses_on_question_id"
    t.index ["round_attempt_id"], name: "index_paper_ques_responses_on_round_attempt_id"
    t.index ["round_paper_response_id"], name: "index_paper_ques_responses_on_round_paper_response_id"
  end

  create_table "papers", force: :cascade do |t|
    t.string "name", null: false
    t.text "instructions"
    t.string "paper_type", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "duration", default: 0
    t.integer "passing_marks"
  end

  create_table "question_papers", force: :cascade do |t|
    t.bigint "paper_id"
    t.bigint "question_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text "description", null: false
    t.string "sub_question_type", null: false
    t.text "hint"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "question_type"
    t.integer "used_count", default: 0
  end

  create_table "results", force: :cascade do |t|
    t.text "description"
    t.bigint "case_study_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["case_study_id"], name: "index_results_on_case_study_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "round_attempts", force: :cascade do |t|
    t.datetime "started_at", precision: nil
    t.datetime "submitted_at", precision: nil
    t.integer "total_score"
    t.string "status", default: "pending"
    t.bigint "job_application_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "remark"
    t.string "recruitable_type"
    t.bigint "recruitable_id"
    t.integer "hiring_round_id"
    t.index ["job_application_id"], name: "index_round_attempts_on_job_application_id"
    t.index ["recruitable_type", "recruitable_id"], name: "index_round_attempts_on_recruitable"
  end

  create_table "round_paper_responses", force: :cascade do |t|
    t.datetime "started_at", precision: nil
    t.datetime "submitted_at", precision: nil
    t.integer "total_score"
    t.integer "round_paper_id"
    t.bigint "round_attempt_id"
    t.bigint "job_application_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "hiring_round_id"
    t.index ["job_application_id"], name: "index_round_paper_responses_on_job_application_id"
    t.index ["round_attempt_id"], name: "index_round_paper_responses_on_round_attempt_id"
  end

  create_table "round_papers", force: :cascade do |t|
    t.bigint "round_id"
    t.bigint "paper_id"
    t.integer "position"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["paper_id"], name: "index_round_papers_on_paper_id"
    t.index ["round_id"], name: "index_round_papers_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.string "name", null: false
    t.text "instructions"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "duration", default: 0
    t.string "round_type"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "short_description"
    t.text "long_description"
    t.string "service_type"
    t.boolean "publish_on", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "features"
    t.string "second_image"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "login_token"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "social_links", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "image"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "solutions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.bigint "case_study_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["case_study_id"], name: "index_solutions_on_case_study_id"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string "full_name"
    t.string "designation"
    t.string "image"
    t.string "video"
    t.text "description"
    t.bigint "client_id"
    t.boolean "publish_on", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["client_id"], name: "index_testimonials_on_client_id"
  end

  create_table "texts", force: :cascade do |t|
    t.string "category"
    t.string "section"
    t.string "key"
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timelines", force: :cascade do |t|
    t.integer "year"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "mobile_number"
    t.string "image"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "values", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.string "category"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at", precision: nil
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "why_choose_us", force: :cascade do |t|
    t.string "reason"
    t.text "description"
    t.string "image"
    t.boolean "publish_on", default: true
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "location"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admin_roles", "admins"
  add_foreign_key "admin_roles", "roles"
  add_foreign_key "challenges", "case_studies"
  add_foreign_key "hiring_rounds", "rounds"
  add_foreign_key "job_designations", "designations"
  add_foreign_key "job_designations", "jobs"
  add_foreign_key "paper_ques_responses", "job_applications"
  add_foreign_key "paper_ques_responses", "questions"
  add_foreign_key "paper_ques_responses", "round_attempts"
  add_foreign_key "paper_ques_responses", "round_paper_responses"
  add_foreign_key "results", "case_studies"
  add_foreign_key "round_paper_responses", "round_attempts"
  add_foreign_key "round_papers", "rounds"
  add_foreign_key "solutions", "case_studies"
end

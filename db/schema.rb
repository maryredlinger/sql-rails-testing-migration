# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "bs_attributec_added_info", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bs_product_id", null: false, unsigned: true
    t.integer "bs_attributec_id", null: false, unsigned: true
    t.string "bs_attributec_added_desc1", limit: 300
    t.string "bs_attributec_added_desc2", limit: 300
    t.string "bs_attributec_added_desc3", limit: 300
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "bs_attributec_info", primary_key: "bs_attributec_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "old_product_color_id", unsigned: true
    t.string "bs_attributec_name", limit: 50, null: false
    t.integer "bs_attributec_sort_order", default: 0
    t.string "bs_attributec_tag", limit: 25, default: ""
    t.integer "bs_attributec_status", default: 0
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "bs_attributeo_added_info", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bs_product_id", null: false, unsigned: true
    t.integer "bs_attributeo_id", null: false, unsigned: true
    t.string "bs_attributeo_added_desc1", limit: 300
    t.string "bs_attributeo_added_desc2", limit: 300
    t.string "bs_attributeo_added_desc3", limit: 300
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "bs_attributeo_info", primary_key: "bs_attributeo_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "old_product_color_id", unsigned: true
    t.string "bs_attributeo_name", limit: 50, null: false
    t.integer "bs_attributeo_sort_order", default: 0
    t.string "bs_attributeo_tag", limit: 25, default: ""
    t.decimal "bs_attributeo_surcharge", precision: 5, scale: 2, default: "0.0"
    t.integer "bs_attributeo_status", default: 0
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "bs_attributes_added_info", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bs_product_id", null: false, unsigned: true
    t.integer "bs_attributes_id", null: false, unsigned: true
    t.string "bs_attributes_dimensions", limit: 30, null: false
    t.string "bs_attributes_added_desc1", limit: 30
    t.string "bs_attributes_added_desc2", limit: 30
    t.string "bs_attributes_added_desc3", limit: 30
    t.decimal "bs_attributes_surcharge", precision: 5, scale: 2, default: "0.0"
    t.integer "bs_attributes_image_count", limit: 1, default: 1
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "bs_attributes_info", primary_key: "bs_attributes_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "bs_attributes_short_name", limit: 50, null: false
    t.string "bs_attributes_name", limit: 50, null: false
    t.integer "bs_attributes_sort_order", null: false
    t.integer "bs_attributes_status", default: 0
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "bs_category_info", primary_key: "bs_category_id", id: :integer, limit: 1, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "bs_category_name", limit: 30, null: false
    t.string "bs_category_description", limit: 500
    t.integer "bs_category_status", limit: 1, null: false
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "bs_message_info", primary_key: "bs_message_id", id: :integer, limit: 1, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "bs_message_name", limit: 30, null: false
    t.timestamp "bs_message_from_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "bs_message_thru_date", null: false
    t.string "bs_message_text", limit: 500, null: false
    t.integer "bs_message_status", limit: 1, null: false
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "bs_product_attribute_info", primary_key: "bs_product_attribute_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bs_product_id", null: false, unsigned: true
    t.integer "bs_attributes_id", unsigned: true
    t.integer "bs_attributec_id", unsigned: true
    t.integer "bs_attributeo_id", unsigned: true
    t.integer "bs_product_attribute_quantity", default: 0, unsigned: true
    t.integer "bs_product_attribute_status", limit: 1, default: 0, null: false, unsigned: true
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "gm_product_size_link_id", unsigned: true
    t.index ["bs_product_id", "bs_attributec_id", "bs_product_attribute_status"], name: "IX_bs_product_attribute_info_prodid_colorid_status"
    t.index ["bs_product_id", "bs_attributes_id", "bs_attributec_id", "bs_attributeo_id"], name: "IX_bs_product_attribute_info_prodid_sizeid_colorid_otherid", unique: true
    t.index ["bs_product_id", "bs_attributes_id", "bs_product_attribute_status", "bs_product_attribute_quantity"], name: "IX_bs_product_attribute_info_prodid_sizeid_status_qty"
  end

  create_table "bs_product_attribute_info_20180807", primary_key: "bs_product_attribute_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bs_product_id", null: false, unsigned: true
    t.integer "bs_attributes_id", unsigned: true
    t.integer "bs_attributec_id", unsigned: true
    t.integer "bs_attributeo_id", unsigned: true
    t.integer "bs_product_attribute_quantity", default: 0, unsigned: true
    t.integer "bs_product_attribute_status", limit: 1, default: 0, null: false, unsigned: true
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "gm_product_size_link_id", unsigned: true
    t.index ["bs_product_id", "bs_attributes_id", "bs_attributec_id", "bs_attributeo_id"], name: "IX_bs_product_attribute_info2_prodid_sizeid_colorid_otherid", unique: true
    t.index ["bs_product_id", "bs_attributes_id", "bs_product_attribute_status", "bs_product_attribute_quantity"], name: "IX_bs_product_attribute_info2_prodid_sizeid_status_qty"
  end

  create_table "bs_product_info", primary_key: "bs_product_id", id: :integer, limit: 1, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "bs_product_name", limit: 40, default: "", null: false
    t.string "bs_product_description", limit: 100
    t.string "bs_product_tag", limit: 25
    t.string "bs_product_sub_dir", limit: 20, default: "app/", null: false
    t.string "bs_product_image_file", limit: 500
    t.string "bs_product_search_criteria", limit: 500
    t.string "bs_product_information", limit: 500
    t.integer "bs_product_sort_order", limit: 1, default: 0, null: false, unsigned: true
    t.decimal "bs_product_price", precision: 5, scale: 2
    t.string "invoice_product_id", limit: 20
    t.integer "bs_category_id", limit: 1
    t.integer "bs_display_style_id", limit: 1, default: 0, null: false
    t.string "bs_product_cosz_code", limit: 1, default: "C", null: false
    t.string "bs_product_category_code", limit: 2, default: "NA", null: false
    t.integer "bs_product_status", limit: 1, default: 0, null: false
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "bs_search_detail_added_info", primary_key: "bs_search_detail_info_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "bs_search_detail_added_name", limit: 50, null: false
    t.string "bs_search_detail_added_description", limit: 200, null: false
    t.string "bs_search_detail_added_image_file", limit: 100
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "bs_search_detail_info", primary_key: ["bs_search_detail_info_id", "bs_search_detail_parent_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bs_search_detail_info_id", null: false, unsigned: true
    t.integer "bs_search_detail_parent_id", null: false, unsigned: true
    t.string "bs_search_detail_name", limit: 20, null: false
    t.string "bs_search_detail_header", limit: 20, null: false
    t.string "bs_search_detail_description", limit: 100, null: false
    t.string "bs_search_detail_image_file", limit: 100, null: false
    t.integer "bs_search_detail_sort_order", limit: 1, null: false
    t.integer "bs_product_id", null: false
    t.integer "bs_search_detail_status", limit: 1, null: false
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "category_hl_info", primary_key: "category_hl_info_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "category_hl_name", limit: 45, null: false
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "category_status", unsigned: true
    t.integer "category_sort_order", unsigned: true
  end

  create_table "category_info", primary_key: "category_info_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "category_name", limit: 45, null: false
    t.string "category_description", limit: 500, default: "", null: false
    t.string "category_image_file", null: false
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "category_status", unsigned: true
    t.integer "category_sort_order", unsigned: true
  end

  create_table "conference_info", primary_key: "conference_info_id", id: :integer, limit: 1, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "conference_name", limit: 30, null: false
    t.string "conference_description", limit: 100
    t.string "conference_dates", limit: 50
    t.integer "conference_status", limit: 1, null: false
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["conference_name"], name: "conference_name", unique: true
  end

  create_table "conference_inventory_info", primary_key: ["conference_info_id", "conference_inventory_type_id", "gm_product_size_link_id", "product_color_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "conference_info_id", null: false, unsigned: true
    t.integer "conference_inventory_type_id", null: false, unsigned: true
    t.integer "gm_product_size_link_id", null: false, unsigned: true
    t.integer "product_color_id", null: false, unsigned: true
    t.integer "product_quantity", default: 0, unsigned: true
    t.timestamp "modify_date"
  end

  create_table "foxy_order_detail", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "transaction_id", limit: 50, null: false
    t.integer "detail_sequence_id", null: false
    t.string "category_code", limit: 50
    t.string "product_name", limit: 50
    t.string "product_code", limit: 50
    t.string "product_price", limit: 50
    t.string "product_quantity", limit: 50
    t.string "product_weight", limit: 50
    t.string "product_options", limit: 200
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "foxy_order_summary", primary_key: "foxy_order_summary_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "transaction_id", limit: 20
    t.string "store_id", limit: 20
    t.string "transaction_datetime", limit: 25
    t.string "product_total", limit: 10
    t.string "tax_total", limit: 10
    t.string "shipping_total", limit: 10
    t.string "discount_total", limit: 10
    t.string "order_total", limit: 10
    t.string "cc_type", limit: 50
    t.string "cc_num", limit: 50
    t.string "processor_response", limit: 50
    t.string "some_status", limit: 50
    t.string "customer_id", limit: 50
    t.string "customer_anonymous", limit: 50
    t.string "bill_first_name", limit: 50
    t.string "bill_last_name", limit: 50
    t.string "bill_company", limit: 50
    t.string "bill_addr1", limit: 50
    t.string "bill_addr2", limit: 50
    t.string "bill_city", limit: 50
    t.string "bill_state", limit: 20
    t.string "bill_zipcode", limit: 10
    t.string "bill_country", limit: 10
    t.string "bill_phone", limit: 20
    t.string "bill_email", limit: 100
    t.string "ip_addr", limit: 50
    t.string "custom_fields", limit: 2000
    t.string "coupons_used", limit: 200
    t.string "ship_method", limit: 50
    t.string "ship_first_name", limit: 50
    t.string "ship_last_name", limit: 50
    t.string "ship_company", limit: 50
    t.string "ship_addr1", limit: 50
    t.string "ship_addr2", limit: 50
    t.string "ship_city", limit: 50
    t.string "ship_state", limit: 20
    t.string "ship_zipcode", limit: 10
    t.string "ship_country", limit: 10
    t.string "ship_phone", limit: 20
    t.string "ship_email", limit: 100
    t.string "receipt_url", limit: 500
    t.string "comments", limit: 500
    t.string "web_source", limit: 20
    t.string "tax_name", limit: 50
    t.string "tax_rate", limit: 10
    t.integer "order_status", limit: 1, default: 0
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "gm_category2_info", primary_key: "category_info_id", id: :integer, limit: 1, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "category_name", limit: 30, null: false
    t.string "category_description", limit: 500
    t.string "category_button_name", limit: 20
    t.integer "category_status", limit: 1, null: false
    t.integer "category_sort_order", limit: 1, null: false
    t.string "category_image_file", limit: 500
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "gm_category_info", primary_key: "category_info_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "category_name", limit: 30, null: false
    t.string "category_button_name", limit: 20
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "category_status", null: false
    t.integer "category_sort_order", null: false
    t.string "category_image_file", limit: 500
  end

  create_table "gm_discount_info", primary_key: ["product_info_id", "discount_start_date"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "product_info_id", null: false, unsigned: true
    t.date "discount_start_date", null: false
    t.date "discount_end_date", null: false
    t.decimal "discount_price", precision: 5, scale: 2
  end

  create_table "gm_post_purchase", primary_key: "gm_post_purchase_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "gm_product_size_link_id", null: false, unsigned: true
    t.integer "product_color_id", null: false, unsigned: true
    t.integer "product_quantity", default: 0, unsigned: true
    t.string "order_number", limit: 15, null: false
    t.string "transaction_applied", limit: 1, default: "0", null: false
    t.integer "old_quantity", default: 0, unsigned: true
    t.integer "new_quantity", default: 0, unsigned: true
    t.timestamp "create_date", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "modify_date"
    t.index ["transaction_applied", "product_color_id", "gm_product_size_link_id"], name: "IX_gm_post_purchase_transapplied_colorid_pslid"
  end

  create_table "gm_post_purchase_20190101", primary_key: "gm_post_purchase_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "gm_product_size_link_id", null: false, unsigned: true
    t.integer "product_color_id", null: false, unsigned: true
    t.integer "product_quantity", default: 0, unsigned: true
    t.string "order_number", limit: 15, null: false
    t.string "transaction_applied", limit: 1, default: "0", null: false
    t.integer "old_quantity", default: 0, unsigned: true
    t.integer "new_quantity", default: 0, unsigned: true
    t.timestamp "create_date", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "modify_date"
  end

  create_table "gm_post_purchase_old_rev2", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "gm_product_size_link_id", null: false, unsigned: true
    t.integer "product_color_id", null: false, unsigned: true
    t.integer "product_quantity", default: 0, unsigned: true
    t.string "order_number", limit: 15, null: false
    t.string "transaction_applied", limit: 1, default: "0", null: false
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "gm_post_purchase_test", primary_key: "gm_post_purchase_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "gm_product_size_link_id", null: false, unsigned: true
    t.integer "product_color_id", null: false, unsigned: true
    t.integer "product_quantity", default: 0, unsigned: true
    t.string "order_number", limit: 15, null: false
    t.string "transaction_applied", limit: 1, default: "0", null: false
    t.integer "old_quantity", default: 0, unsigned: true
    t.integer "new_quantity", default: 0, unsigned: true
    t.timestamp "create_date", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "modify_date"
  end

  create_table "gm_post_purchases_old", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "gm_product_size_link_id", null: false, unsigned: true
    t.integer "product_color_id", null: false, unsigned: true
    t.integer "product_quantity", default: 0, unsigned: true
    t.string "order_number", limit: 15, null: false
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "gm_product2_info", primary_key: "product_info_id", id: :integer, limit: 1, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "category_info_id", limit: 1, null: false, unsigned: true
    t.string "product_name", limit: 40, default: "", null: false
    t.string "product_description", limit: 300
    t.string "product_tag", limit: 25
    t.string "product_button_name", limit: 30
    t.string "product_image_file", limit: 500
    t.string "product_search_criteria", limit: 500
    t.string "product_information", limit: 250
    t.integer "product_sort_order", limit: 1, default: 0, null: false, unsigned: true
    t.integer "product_status", limit: 1, default: 0, null: false, unsigned: true
    t.decimal "product_price", precision: 5, scale: 2
    t.string "product_id", limit: 20
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "snsid", limit: 1
  end

  create_table "gm_product_info", primary_key: "product_info_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "category_info_id", null: false, unsigned: true
    t.string "product_name", limit: 25, default: "", null: false
    t.string "product_description", limit: 100
    t.string "product_tag", limit: 25
    t.string "product_small_image_file"
    t.string "product_search_criteria"
    t.string "product_information", limit: 250
    t.integer "product_sort_order", default: 0, null: false, unsigned: true
    t.integer "product_status", default: 0, null: false, unsigned: true
    t.decimal "product_price", precision: 5, scale: 2
    t.string "product_id", limit: 20
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "snsid"
  end

  create_table "gm_product_size_color_link", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "gm_product_size_link_id", null: false, unsigned: true
    t.integer "product_color_id", null: false, unsigned: true
    t.integer "product_quantity", default: 0, unsigned: true
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "status", limit: 1, default: 0
  end

  create_table "gm_product_size_link", primary_key: "gm_product_size_link_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "product_info_id", null: false, unsigned: true
    t.integer "product_size_id", null: false, unsigned: true
    t.string "product_size_description", limit: 50
    t.string "product_size_dimension", limit: 50
    t.decimal "product_size_surcharge", precision: 5, scale: 2
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "gm_search_info", primary_key: "gm_search_info_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "gm_search_parent_id", null: false, unsigned: true
    t.string "gm_search_name", limit: 15, null: false
    t.string "gm_search_header", limit: 15, null: false
    t.string "gm_search_description", limit: 100, null: false
    t.string "gm_search_image_file", limit: 100, null: false
    t.integer "gm_search_sort_order", limit: 1, null: false
    t.integer "gm_product_info_id", null: false
    t.integer "gm_search_status", limit: 1, null: false
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "hl_category_product_link", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "category_hl_info_id", null: false, unsigned: true
    t.integer "product_hl_info_id", null: false, unsigned: true
  end

  create_table "invadj_info", primary_key: "invadj_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "invadj_name_id", null: false, unsigned: true
    t.integer "product_info_id", null: false, unsigned: true
    t.integer "product_size_id", null: false, unsigned: true
    t.integer "product_color_id", null: false, unsigned: true
    t.integer "product_quantity", default: 0, unsigned: true
    t.integer "product_quantity_out", default: 0
    t.timestamp "create_date", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "modify_date", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["invadj_name_id", "product_info_id"], name: "idx_invadj_info_invadj_name_id_product_info_id"
  end

  create_table "invadj_info_HOLDINFO", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "invadj_id", null: false, unsigned: true
    t.string "backupname", limit: 20, null: false
    t.integer "invadj_name_id", null: false, unsigned: true
    t.integer "product_info_id", null: false, unsigned: true
    t.integer "product_size_id", null: false, unsigned: true
    t.integer "product_color_id", null: false, unsigned: true
    t.integer "product_quantity", default: 0, unsigned: true
    t.integer "product_quantity_out", default: 0
    t.timestamp "create_date", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "modify_date", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["invadj_id", "backupname"], name: "ix_invadj_info_HOLDINFO_invadj_id_backupname", unique: true
  end

  create_table "invadj_name_info", primary_key: "invadj_name_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "invadj_name", limit: 30, null: false
    t.string "invadj_desc", limit: 100, null: false
    t.date "invadj_date", null: false
    t.timestamp "invadj_applied_date"
    t.binary "invadj_add_to_inv", limit: 1, default: "b'0'"
    t.timestamp "create_date", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "modify_date"
    t.index ["invadj_name"], name: "IX_invadj_name_info_invadj_name", unique: true
  end

  create_table "price_type", primary_key: "price_type_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "price_type_name", limit: 45, null: false
    t.string "price_type_description"
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "product_color", primary_key: "product_color_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "product_color_name", limit: 50, null: false
    t.integer "product_color_sort_order", default: 0
    t.string "color_tag", limit: 25
    t.integer "product_color_status", default: 0
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
    t.string "image_file", limit: 100
    t.string "image_color", limit: 100
  end

  create_table "product_hl_info", primary_key: "product_info_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "product_name", limit: 100, default: "", null: false
    t.string "product_description", limit: 1000
    t.string "product_small_image_file"
    t.string "product_search_criteria"
    t.string "product_suffix", limit: 10
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "product_sort_order", default: 0, null: false, unsigned: true
    t.integer "product_status", default: 0, null: false, unsigned: true
  end

  create_table "product_info", primary_key: "product_info_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "product_id", limit: 20, null: false
    t.string "product_name", limit: 100, default: "", null: false
    t.string "product_description", limit: 1000
    t.string "product_small_image_file"
    t.string "product_large_image_file"
    t.integer "category_info_id", null: false, unsigned: true
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "product_sort_order", default: 0, null: false, unsigned: true
    t.integer "product_status", default: 0, null: false, unsigned: true
  end

  create_table "product_price", primary_key: "product_price_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "product_info_id", default: 0, null: false, unsigned: true
    t.integer "price_type_id", null: false, unsigned: true
    t.decimal "unit_price", precision: 5, scale: 2, null: false
    t.decimal "case_price", precision: 5, scale: 2, null: false
    t.string "unit_price_description", limit: 45, null: false
    t.string "case_price_description", limit: 45, null: false
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
    t.string "unit_type", limit: 10, default: "", null: false
    t.string "case_type", limit: 10, default: "", null: false
  end

  create_table "product_size", primary_key: "product_size_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "product_size_name", limit: 50, null: false
    t.string "product_size_description", limit: 50, null: false
    t.string "product_dimensions", limit: 100
    t.integer "product_size_sort_order", null: false
    t.integer "product_size_status", default: 0
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }
    t.decimal "product_size_surcharge", precision: 5, scale: 2
  end

  create_table "qty_sold", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ord_id", limit: 20, null: false
    t.string "item_name", limit: 50, null: false
    t.integer "item_qty", null: false
    t.string "psl_id", limit: 10, null: false
    t.string "col_id", limit: 10, null: false
    t.datetime "ord_date", null: false
    t.index ["psl_id", "col_id"], name: "IX_qty_sold_psclid"
  end

  create_table "search_category_detail_link", primary_key: ["search_category_info_id", "search_detail_info_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "search_category_info_id", null: false, unsigned: true
    t.integer "search_detail_info_id", null: false, unsigned: true
    t.integer "search_category_detail_sort_order", limit: 1, null: false
    t.integer "search_category_detail_status", limit: 1, null: false
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "search_category_info", primary_key: "search_category_info_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "search_category_name", limit: 20, null: false
    t.string "search_category_description", limit: 100, null: false
    t.integer "search_category_sort_order", limit: 1, null: false
    t.integer "search_category_status", limit: 1, null: false
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "search_detail_info", primary_key: "search_detail_info_id", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "search_detail_parent_id", null: false, unsigned: true
    t.string "search_detail_name", limit: 20, null: false
    t.string "search_detail_header", limit: 20, null: false
    t.string "search_detail_description", limit: 100, null: false
    t.string "search_detail_image_file", limit: 100, null: false
    t.integer "search_detail_sort_order", limit: 1, null: false
    t.integer "gm_product_info_id", null: false
    t.integer "search_detail_status", limit: 1, null: false
    t.timestamp "stamp_modify_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "temp_adjust_sort_order", primary_key: "taso_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bs_attributeo_id", default: 0
    t.string "bs_attributeo_name", limit: 50, default: ""
    t.integer "bs_attributeo_sort_order", default: 0
    t.integer "new_sort_order", default: 0
  end

end

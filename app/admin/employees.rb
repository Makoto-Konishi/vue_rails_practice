ActiveAdmin.register Employee do
  # permit_params ActiveAdmin 経由で操作を許可する属性を定義する
  # ID や lock_version 等の自動で設定される値以外は全て許可
  permit_params :name, :department, :gender, :birth, :joined_date, :payment, :note
end

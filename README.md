# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- version

  - rails 6.1.7.3
  - ruby 3.2.0
  - node v16.19.0
  - postgres (PostgreSQL) 14.7 (Homebrew)

- 建立環境變數
  -把`.env.sample`改名為`.env.development.local`

- master.key
  - 編輯 vim
    - $EDITOR=vim rails credentials:edit
  - 查 Value
    - $Rails.application.credentials.dig(:google_oauth_client_id)
# RFV

class Payment < ApplicationRecord

    def self.diamond_grade
        if Payment.last.amount === 50
            diamond_grade = "白鑽會員"
        elsif Payment.last.amount === 100
            diamond_grade = "藍鑽會員"
        else
            diamond_grade = "紅鑽會員"
        end
    end

    def self.expire_time
        expire_time = Payment.last.pay_time + 1.year
    end
end

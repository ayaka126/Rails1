class Post < ApplicationRecord
    validates :title,presence: true,length:{maximum: 20}
    validates :start_at,presence: true
    validates :end_at,presence: true
    validates :memo,length:{maximum: 500}
    validate :start_end_check

    def start_end_check
        return false if end_at.blank? || start_at.blank?
        if end_at < start_at
          errors.add(:end_at,"は開始日以降の日付を選択してください")
        end
    end
end

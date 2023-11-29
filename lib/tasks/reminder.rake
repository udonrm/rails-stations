namespace :reminder do
    desc "send email to users making reservation"
    task send_email: :environment do
        Reservation.where(date: Time.zone.tomorrow).each do |reservation|
            UserMailer.reservation_reminder_email(reservation).deliver_now
        end
    end
end
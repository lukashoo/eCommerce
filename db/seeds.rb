User.create!([
  {email: "lukashoo@o2.pl", encrypted_password: "$2a$10$5nJtLrdGARDKn0nKo3/mge92qkq6mOp/Np3/wmz8EdDZj0GtplELK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, name: "User2", confirmation_token: "FiSdPP-FrK3dVozP2GNT", confirmed_at: "2015-10-03 15:27:46", confirmation_sent_at: "2015-10-03 15:27:35", unconfirmed_email: nil, role: 0, surname: "Surname2", other: nil},
  {email: "l.grzeszkowiak@gmail.com", encrypted_password: "$2a$10$YfvLAorSHa1xK9DgqREGSeBpzX1F7znNOvRsAId.6OAH6DOkboV7u", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-10-04 10:57:53", last_sign_in_at: "2015-10-03 22:29:28", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Name1", confirmation_token: "-CSw4FYMzVsBZUkit_mk", confirmed_at: "2015-10-03 15:23:58", confirmation_sent_at: "2015-10-03 15:22:50", unconfirmed_email: nil, role: 2, surname: "Admin", other: nil},
  {email: "lukasz.grzeszkowiak@gmail.com", encrypted_password: "$2a$10$8f5JscKc0gJP8yhbNnm3T.27HSWoqDiUOW5sR4QRFoDy0GJHDcjIS", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-10-03 17:17:22", last_sign_in_at: "2015-10-03 17:17:22", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "Normal", confirmation_token: "_d6mzkSb84gExW-8zAu5", confirmed_at: "2015-10-03 15:24:04", confirmation_sent_at: "2015-10-03 15:23:26", unconfirmed_email: nil, role: 0, surname: "Surname1", other: nil}
])
Address.create!([
  {user_id: nil, apartment_building_id: 1, town_city: "Miasto", street: "Ulica", zip_postcode: "55-556", country: "Proland"},
  {user_id: 1, apartment_building_id: nil, town_city: "Admin City", street: "Admin street", zip_postcode: "40-312", country: "Admin Country"},
  {user_id: 2, apartment_building_id: nil, town_city: "User City", street: "User street", zip_postcode: "11-112", country: "User Country"},
  {user_id: 3, apartment_building_id: nil, town_city: "User2 City", street: "User2 street", zip_postcode: "11-112", country: "User2 Country"}
])
Apartment.create!([
  {apartment_building_id: 1, apartment_type_id: 1, bathroom_count: 1, bedroom_count: 2, room_count: 1, other: "Random things", user_id_1: 2, user_id_2: 3, apt_number: 1, image: "http://inhomein.com/wp-content/uploads/2015/09/living-room-ideas-for-small-apartments2.jpg"},
  {apartment_building_id: 1, apartment_type_id: 2, bathroom_count: 1, bedroom_count: 1, room_count: 1, other: "Random things2", user_id_1: 2, user_id_2: nil, apt_number: 2, image: "http://cdn.freshome.com/wp-content/uploads/2009/01/apartment-room.jpg"}
])
ApartmentBuilding.create!([
  {short_name: "Test building", full_name: "Long_test_building", description: "This is a test building", manager: "Super Manager", phone: "667667667", other: "other"}
])
ApartmentFacility.create!([
  {facility_id: 1, apartment_id: 1, number_units: "11.0"},
  {facility_id: 2, apartment_id: 1, number_units: "1.0"},
  {facility_id: 6, apartment_id: 1, number_units: "47.1"},
  {facility_id: 8, apartment_id: 1, number_units: "627.0"},
  {facility_id: 10, apartment_id: 1, number_units: "3.0"},
  {facility_id: 7, apartment_id: 2, number_units: "38.6"},
  {facility_id: 9, apartment_id: 2, number_units: "420.0"},
  {facility_id: 11, apartment_id: 2, number_units: "2.0"},
  {facility_id: 4, apartment_id: 2, number_units: "8.0"}
])
ApartmentType.create!([
  {description: "Apartament"},
  {description: "Kawalerka"}
])
Facility.create!([
  {apartment_building_id: 1, apartment_type_id: 1, description: "Centrum Rekreacji", prize_unit: "5.0"},
  {apartment_building_id: 1, apartment_type_id: 1, description: "Garaż", prize_unit: "15.0"},
  {apartment_building_id: 1, apartment_type_id: 2, description: "Centrum Rekreacji", prize_unit: "5.0"},
  {apartment_building_id: 1, apartment_type_id: 2, description: "Garaż", prize_unit: "15.0"},
  {apartment_building_id: 1, apartment_type_id: 1, description: "Zaliczka Centralne Ogrzewanie (m2)", prize_unit: "2.5"},
  {apartment_building_id: 1, apartment_type_id: 2, description: "Zaliczka Centralne Ogrzewanie (m2)", prize_unit: "2.0"},
  {apartment_building_id: 1, apartment_type_id: 1, description: "Fundusz remontowy (udział)", prize_unit: "0.1"},
  {apartment_building_id: 1, apartment_type_id: 2, description: "Fundusz remontowy (udział)", prize_unit: "0.07"},
  {apartment_building_id: 1, apartment_type_id: 1, description: "Śmieci (osoby)", prize_unit: "12.2"},
  {apartment_building_id: 1, apartment_type_id: 2, description: "Śmieci (osoby)", prize_unit: "11.5"}
])
Invoice.create!([
  {apartment_id: 1, date: "2015-10-03 19:02:20", sum: "120.0", status: false, number: "F/super/numer", pay_date: "2015-10-03 19:02:20", operation_date: nil},
  {apartment_id: 1, date: "2015-10-03 19:02:20", sum: "230.24", status: true, number: "F/super/numer2", pay_date: "2015-10-03 19:02:20", operation_date: "2015-10-03 19:02:20"},
  {apartment_id: 2, date: "2015-10-03 19:02:20", sum: "122.34", status: true, number: "F/super/numer3", pay_date: "2015-10-03 19:02:20", operation_date: nil}
])
UserApartmentHistory.create!([
  {user_id: 2, apartment_id: 1, ownership_type: 1, start_date: "2015-10-03 17:41:36", end_date: nil},
  {user_id: 3, apartment_id: 1, ownership_type: 2, start_date: "2015-10-04 13:12:55", end_date: nil},
  {user_id: 3, apartment_id: 2, ownership_type: 1, start_date: "2015-10-03 17:41:54", end_date: nil}
])

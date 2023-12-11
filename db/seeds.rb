# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# rubocop:disable all
require 'faker'
user1 = User.create(email: 'user1@example.com', username: 'user1')
user1.password = 'password123'
user1.save!

user2 = User.create(email: 'user2@example.com', username: 'user2')
user2.password = 'password456'
user2.save!

# Crear dos enlaces para cada usuario
Link.link_types.keys.each do |link_type|
    2.times do
        name = Faker::Lorem.unique.word
        name = Faker::Lorem.unique.word until name.length >= 3
      link = Link.new(
        user: user1,
        name: name,
        url: Faker::Internet.url,
        link_type: link_type
      )
  
      case link_type.to_sym
      when :temporary
        link.expiration_date = Faker::Time.forward(days: 30)
      when :private_link
        link.password = 'password123'
        link.password_confirmation = 'password123'
      end
  
      link.save!
    end
  
    2.times do
        name = Faker::Lorem.unique.word
        name = Faker::Lorem.unique.word until name.length >= 3
      link = Link.new(
        user: user2,
        name: name,
        url: Faker::Internet.url,
        link_type: link_type
      )
  
      case link_type.to_sym
      when :temporary
        link.expiration_date = Faker::Time.forward(days: 30) 
      when :private_link
        link.password = 'password456'
        link.password_confirmation = 'password456'
      end
  
      link.save!
    end
  end

  temporal_link_user1 = Link.find_by(user: user1, link_type: Link.link_types[:temporary])
  if temporal_link_user1
    temporal_link_user1.expiration_date = 2.minutes.from_now
    temporal_link_user1.save!
  end
  temporal_link_user1 = Link.find_by(user: user1, link_type: Link.link_types[:temporary])
  if temporal_link_user1
    temporal_link_user1.expiration_date = 2.minutes.from_now
    temporal_link_user1.save!
  end

  Link.all.each do |link|
    10.times do |i|
      # Genera una fecha y hora aleatoria en el pasado
      accessed_at = Faker::Time.backward(days: i)
      
      ip_address1 = Faker::Internet.unique.ip_v4_address
      ip_address2 = Faker::Internet.unique.ip_v4_address
  
      Visit.create!(
        link: link,
        accessed_at: accessed_at,
        ip_address: ip_address1
      )
  
      Visit.create!(
        link: link,
        accessed_at: accessed_at + 1.minute,  
        ip_address: ip_address2
      )
    end
  end
  

# rubocop:enable all
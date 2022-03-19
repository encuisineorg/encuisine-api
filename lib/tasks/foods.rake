# frozen_string_literal: true

namespace :foods do
  task import_from_mesfruitsetlegumesdesaison: :environment do
    file = File.read(Rails.root.join('data', 'products.json'))
    json = JSON.parse(file)
    json.each do |food|
      name = food['label']['fr']
      months = food['months']
      emoji = food['emoji']
      local = food['local']
      pef = food['pef']
      co2 = food['CO2']

      food = Food.where(name: name).first_or_create(
        months: months,
        emoji: emoji,
        local: local,
        pef: pef,
        co2: co2,
      )
    end
  end

  task import_from_ciqual: :environment do
    file = File.open(Rails.root.join('data', 'alim_2020_07_07.xml'))
    xml = Nokogiri::XML(file)
    xml.xpath("//TABLE/ALIM").each do |alim|
      name = alim.at_css("alim_nom_fr").content.strip
      ciqual_code = alim.at_css("alim_code").content.strip.to_i
      ciqual_grp_code = alim.at_css("alim_grp_code").content.strip.to_i
      ciqual_ssgrp_code = alim.at_css("alim_ssgrp_code").content.strip.to_i
      ciqual_ssssgrp_code = alim.at_css("alim_ssssgrp_code").content.strip.to_i

      food = Food.where(name: name, ciqual_code: ciqual_code).first_or_create(
        ciqual_grp_code: ciqual_grp_code,
        ciqual_ssgrp_code: ciqual_ssgrp_code,
        ciqual_ssssgrp_code: ciqual_ssssgrp_code,
      )
    end
  end
end

@cc
Given('selecciono la {string} como {string}') do |valor, campo|
    option = find(:xpath, "/html/body/form/h2[2]/select/option[2]").text
    find(option).click
end
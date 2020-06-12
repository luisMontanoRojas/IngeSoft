Given('cuando estoy en la pagina de inicio') do
  visit '/'
end

Given('ingreso el codigo {string} en el campo {string}') do |valor, campo|
  fill_in(campo, :with => valor)
end

When('presiono el boton {string}') do |string|
  click_button(string)
end

Then('deberia ver una la pagina game') do
  visit '/game' 
end
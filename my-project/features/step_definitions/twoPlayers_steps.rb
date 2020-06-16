
Given('Escribo {string} en el campo de nombre') do |string|
    visit '/http://localhost:4567/twoPlayers', :get, "namePlayer1=string"
end

When('Presiono el boton siguiente de two player') do
    visit '/http://localhost:4567/twoPlayers', :get, "click_link=Siguiente"
end

Then('Deberia ver la pagina de one player') do
    visit '/http://localhost:4567/twoPlayers', :get, "visit'/http://localhost:4567/onePlayer'"
end

When('Presiono el boton siguiente de one player') do
    visit '/http://localhost:4567/onePlayer', :get, "click_link=Siguiente"
end

Then('Deberia ver la pagina de juego') do
    visit '/http://localhost:4567/onePlayer', :get, "visit'/http://localhost:4567/game'"
end

Given('Escribo {string} en el campo {string}') do |value, field|
    visit '/http://localhost:4567/twoPlayers', :get, "field=value"
end

Given('Elijo el color  {string} en el campo {string}') do |color, field|
    visit '/http://localhost:4567/twoPlayers', :get, "select color, :from => field"
end
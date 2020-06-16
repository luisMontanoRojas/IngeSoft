When('Presiono el boton jugar') do
    visit '/http://localhost:4567/onePlayer', :get, "click_link=JUGAR!"
  end

  Given('Ingreso el codigo {string} en el campo {string}') do |code, field|
    visit '/http://localhost:4567/game', :get, "field=code"
  end

  When('Presiono el boton {string}') do |name|
    visit '/http://localhost:4567/game', :get, "click_link=name"
  end

  Then('Me mostrara un mensaje {string}') do |message|
    visit '/http://localhost:4567/game', :get, "last_response.body.should =~ /#{message}/m"
  end
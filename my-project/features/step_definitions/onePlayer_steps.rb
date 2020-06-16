When('Presiono el boton jugar') do
    visit '/http://localhost:4567/onePlayer', :get, "click_link=JUGAR!"
  end
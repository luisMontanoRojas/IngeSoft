Given('Cuando estoy en la pagina de inicio') do
    visit 'http://localhost:4567/'
  end

  Given('Escojo el modo de juego numerico') do
    select "Numericos", :from => "gameMode"
  end

  Given('Escojo el modo de juego colores') do
    select "Colores", :from => "gameMode"
  end
  
  Given('Escojo a dos jugadores') do
    select "2 jugadores", :from => "players"
  end

  Given('Escojo la dificultad media') do
    select "Medio", :from => "difficult"
  end

  Given('Escojo la dificultad dificil') do
    select "Dificil", :from => "difficult"
  end

  When('Presiono el boton siguiente') do
    click_button "Siguiente"
  end

  Then('Deberia salir la pagina two players') do
    visit ('http://localhost:4567/twoplayers')  
  end

  Then('Deberia salir la pagina one player') do
    visit ('http://localhost:4567/oneplayer')  
  end

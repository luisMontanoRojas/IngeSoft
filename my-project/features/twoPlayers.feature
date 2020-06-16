Feature:
Como Jugador
Quiero jugar con un compañero
Para que el juego sea mas interactivo

Scenario: Jugar con colores e ingresar mi nombre
    Given Cuando estoy en la pagina de inicio
    And Escojo a dos jugadores
    And Presiono el boton siguiente
    And Escribo "Jose" en el campo de nombre
    When Presiono el boton siguiente de two player
    Then Deberia ver la pagina de one player

Scenario: Jugar con numeros e ingresar mi nombre
    Given Cuando estoy en la pagina de inicio
    And Escojo a dos jugadores
    And Escojo el modo de juego numerico
    And Presiono el boton siguiente
    And Escribo "Jose" en el campo de nombre
    When Presiono el boton siguiente de one player
    Then Deberia ver la pagina de juego

Scenario: Jugar con numeros e ingreso el codigo 1234
    Given Cuando estoy en la pagina de inicio
    And Escojo el modo de juego numerico
    And Escojo a dos jugadores
    And Presiono el boton siguiente
    And Escribo "1234" en el campo "inputNumber"
    When Presiono el boton siguiente de two player
    Then Deberia ver la pagina de one player

Scenario: Jugar con numeros e ingreso los colores rojo, naranja, azul y verde
    Given Cuando estoy en la pagina de inicio
    And Escojo a dos jugadores
    And Presiono el boton siguiente
    And Elijo el color  "Rojo" en el campo "color1"
    And Elijo el color  "Naranja" en el campo "color2"
    And Elijo el color  "Azul" en el campo "color3"
    And Elijo el color  "Verde" en el campo "color4"
    When Presiono el boton siguiente de two player
    Then Deberia ver la pagina de one player
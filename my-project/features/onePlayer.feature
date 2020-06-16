Feature:
Como Jugador
Quiero poder jugar solo
Para jugar cuando este solo

Scenario: Jugando en modo colores ingreso mi nombre de jugador
    Given Cuando estoy en la pagina de inicio
    And Presiono el boton siguiente
    And Escribo "Andre" en el campo de nombre
    When Presiono el boton jugar
    Then Deberia ver la pagina de juego

Scenario: Jugando en modo numerico ingreso mi nombre de jugador
    Given Cuando estoy en la pagina de inicio
    And Escojo el modo de juego numerico
    And Presiono el boton siguiente
    And Escribo "Andre" en el campo de nombre
    When Presiono el boton jugar
    Then Deberia ver la pagina de juego

Scenario: Adivino un codigo numerico
    Given Cuando estoy en la pagina de inicio
    And Escojo el modo de juego numerico
    And Presiono el boton siguiente
    And Escribo "Andre" en el campo de nombre
    And Presiono el boton jugar
    And Ingreso el codigo "1234" en el campo "code"
    When Presiono el boton "verificar"
    Then Me mostrara un mensaje "En el intento # 1"
Feature:
Como Jugador
Quiero jugar con un compañero
Para que el juego sea mas interactivo

Scenario: Jugar con colores y toda la configuracion predefinida
    Given Cuando estoy en la pagina de inicio
    And Escojo el modo de juego colores
    And Escojo a dos jugadores
    And Presiono el boton siguiente
    Given Deberia salir la pagina two players
    And Presiono el boton siguiente de two players
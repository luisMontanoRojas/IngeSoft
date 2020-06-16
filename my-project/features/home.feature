Feature:
Como Jugador
Quiero Configurar mis opciones basicas
Para que el juego sea mas interactivo

Scenario: Jugar con los valores de defecto
    Given Cuando estoy en la pagina de inicio
    When Presiono el boton siguiente
    Then Deberia salir la pagina one player

Scenario: Jugar con dificultad media 
    Given Cuando estoy en la pagina de inicio
    And Escojo la dificultad media
    When Presiono el boton siguiente
    Then Deberia salir la pagina one player

Scenario: Jugar con dificultad dificil 
    Given Cuando estoy en la pagina de inicio
    And Escojo la dificultad dificil
    When Presiono el boton siguiente
    Then Deberia salir la pagina one player

Scenario: Un jugador con colores
    Given Cuando estoy en la pagina de inicio
    And Escojo el modo de juego colores
    When Presiono el boton siguiente
    Then Deberia salir la pagina one player


Scenario: Dos jugadores con numeros

    Given Cuando estoy en la pagina de inicio
    And Escojo el modo de juego numerico
    And Escojo a dos jugadores
    When Presiono el boton siguiente
    Then Deberia salir la pagina two players

Scenario: Dos jugadores con colores

    Given Cuando estoy en la pagina de inicio
    And Escojo el modo de juego colores
    And Escojo a dos jugadores
    When Presiono el boton siguiente
    Then Deberia salir la pagina two players

Feature:
Como Jugador
Quiero Ingresar el codigo secreto
Para mi oponente pueda empezar a adivinar
Scenario:
Given cuando estoy en la pagina de inicio
And ingreso el codigo "1234" en el campo "numberToInput"
When presiono el boton "jugar!" 
Then deberia ver una la pagina game